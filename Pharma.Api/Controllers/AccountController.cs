using System;
using System.Linq;
using System.Web.Http;
using AttributeRouting.Web.Http;
using AutoMapper;
using MiniTrello.Api.Models;
using Pharma.Api.Controllers.AccountControllerHelpers;
using Pharma.Api.Models;
using Pharma.Domain.Entities;
using Pharma.Domain.Services;

namespace Pharma.Api.Controllers
{
    public class AccountController : BaseApiController
    {
        readonly IReadOnlyRepository _readOnlyRepository;
        readonly IWriteOnlyRepository _writeOnlyRepository;
        readonly IMappingEngine _mappingEngine;
        readonly IRegisterValidator<AccountRegisterModel> _registerValidator;
        readonly IRegisterValidator<ChangePassModel> _restoreValidator;
        
        public AccountController(IReadOnlyRepository readOnlyRepository, IWriteOnlyRepository writeOnlyRepository,
            IMappingEngine mappingEngine, IRegisterValidator<AccountRegisterModel> registerValidator, IRegisterValidator<ChangePassModel> restoresValidator)
        {
            _readOnlyRepository = readOnlyRepository;
            _writeOnlyRepository = writeOnlyRepository;
            _mappingEngine = mappingEngine;
            _registerValidator = registerValidator;
            _restoreValidator = restoresValidator;
        }

        [HttpPost]
        [POST("login")]
        public AuthenticationModel Login([FromBody] AccountLoginModel model)
        {
            var encryptObj = new EncryptServices();
            Account account =
                _readOnlyRepository.First<Account>(
                    account1 => account1.Email == model.Email);
            
            if (account != null)
            {
                if (account.Password !=
                encryptObj.EncryptStringToBytes(model.Password, account.EncryptKey, account.EncryptIV))
                {
                    return new AuthenticationModel()
                    {
                        Status = 0,
                        Token = "Clave incorrecta"
                    };
                }
                string token = "";
                TimeSpan availabletime = new TimeSpan();
                var session =
                    _readOnlyRepository.Query<Sessions>(sessions1 => sessions1.User.Email == account.Email)
                        .OrderByDescending(x => x.ExpirationTime)
                        .FirstOrDefault();
                if (session == null || session.ExpirationTime < DateTime.Now)
                {
                    Sessions newsession = SetSessionsModel(account);
                    Sessions newsessionCreated = _writeOnlyRepository.Create(newsession);
                    if (newsessionCreated != null)
                    {
                        token = newsessionCreated.Token;
                        availabletime = (newsessionCreated.ExpirationTime.Subtract(newsessionCreated.LoginDate));
                    }
                    else
                    {
                        return new AuthenticationModel()
                        {
                            Status = 1,
                            Token = "Acceso Denegado: No se puede conectar al servidor, Intentelo Mas Tarde!"
                        };
                    }
                }
                else if (session.ExpirationTime > DateTime.Now)
                {
                    token = session.Token;
                    availabletime = (session.ExpirationTime.Subtract(DateTime.Now));
                }
                return new AuthenticationModel()
                {
                    Status = 2,
                    Token = token,
                    AvailableTime = availabletime
                };
            }
            return new AuthenticationModel()
            {
                Status = 0,
                Token = "Lo sentimos, No existe un usuario con ese Email"
            };
        }

        private Sessions SetSessionsModel(Account account)
        {
            var sessionLoging = new SessionsModel
            {
                User = account,
                LoginDate = DateTime.Now,
                ExpirationTime = DateTime.Now.AddHours(2),
                Token = Guid.NewGuid().ToString()
            };
            Sessions sessionToReturn = _mappingEngine.Map<SessionsModel, Sessions>(sessionLoging);
            return sessionToReturn;
        }

        [POST("register")]
        public AccountRegisterResponseModel Register([FromBody] AccountRegisterModel model)
        {   
            var validateMessage = _registerValidator.Validate(model);
            if (!String.IsNullOrEmpty(validateMessage))
            {
                return new AccountRegisterResponseModel()
                {
                    Message = validateMessage,
                    Status = 1
                };
            }
            var accountExist =
                _readOnlyRepository.First<Account>(
                    account1 => account1.Email == model.Email);
            if (accountExist == null)
            {
                Account account = _mappingEngine.Map<AccountRegisterModel, Account>(model);
                var encryptObj = new EncryptServices();
                encryptObj.GenerateKeys();
                account.Password = encryptObj.EncryptStringToBytes(account.Password, encryptObj.myRijndael.Key,
                    encryptObj.myRijndael.IV);
                account.EncryptKey = encryptObj.myRijndael.Key;
                account.EncryptIV = encryptObj.myRijndael.IV;
                
               /* //AccountSeeder(accountCreated);
                var initboard = new Board() { Title = "Welcome Board"};
                var lanes = Builder<Lane>.CreateListOfSize(3).Build();
                lanes[0].Title = "To Do";
                lanes[0].IsArchived = false;
                lanes[1].Title = "Doing";
                lanes[1].IsArchived = false;
                lanes[2].Title = "Done";
                lanes[2].IsArchived = false;
                foreach (var lane in lanes)
                {
                    _writeOnlyRepository.Create(lane);
                }
                initboard.AddLane(lanes[0]);
                initboard.AddLane(lanes[1]);
                initboard.AddLane(lanes[2]);
                _writeOnlyRepository.Create(initboard);


                var organization = new Organization() { Title = "My Boards", Description = "Default Organization" };
                organization.AddBoard(initboard);
                _writeOnlyRepository.Create(organization);

                account.AddOrganization(organization);
                Account accountCreated = _writeOnlyRepository.Create(account);

                initboard.Administrator = accountCreated;
                _writeOnlyRepository.Update(initboard);
                
                if (accountCreated != null)
                {
                    SendSimpleMessage(accountCreated.FirstName, accountCreated.LastName, accountCreated.Email, model.Password);
                    return new AccountRegisterResponseModel(accountCreated.Email, accountCreated.FirstName, 2);
                }*/
                return new AccountRegisterResponseModel()
                {
                    Message = "Hubo un error al guardar el usuario",
                    Status = 0
                };
            }
            return new AccountRegisterResponseModel(model.Email, model.FirstName, 0);
        }

     
        
        [AcceptVerbs("PUT")]
        [PUT("/organization/updateprofile/{accesstoken}")]
        public UpdateAccountResponseModel UpdateAccount(string accesstoken, [FromBody] AccountUpdateModel model)
        {
            Sessions sessions =
                   _readOnlyRepository.Query<Sessions>(sessions1 => sessions1.Token == accesstoken).FirstOrDefault();
            Account account = sessions.User;
            
            if (account != null)
            {
                if (string.IsNullOrEmpty(model.NewFirstName) || string.IsNullOrEmpty(model.NewLastName) ||
                string.IsNullOrEmpty(model.Password)
                || string.IsNullOrEmpty(model.NewPassword) || string.IsNullOrEmpty(model.ConfirmNewPassword))
                {
                    return new UpdateAccountResponseModel()
                    {
                        Status = 0,
                        Message = "No debe quedar ningun campo Vacio"
                    };
                }
                var encryptObj = new EncryptServices();
                if (account.Password !=
                encryptObj.EncryptStringToBytes(model.Password, account.EncryptKey, account.EncryptIV))
                {
                    return new UpdateAccountResponseModel()
                    {
                        Status = 0,
                        Message = "Clave Actual incorrecta"
                    };
                }
                if (model.NewPassword != model.ConfirmNewPassword)
                {
                    return new UpdateAccountResponseModel()
                    {
                        Status = 0,
                        Message = "La Nueva Clave de coincidir con la confirmacion"
                    };
                }
                account.FirstName = model.NewFirstName;
                account.LastName = model.NewLastName;
                encryptObj.GenerateKeys();
                account.Password = encryptObj.EncryptStringToBytes(model.NewPassword, encryptObj.myRijndael.Key,
                    encryptObj.myRijndael.IV);
                account.EncryptKey = encryptObj.myRijndael.Key;
                account.EncryptIV = encryptObj.myRijndael.IV;
                _writeOnlyRepository.Update(account);
               // SendUpdateMessage(model.NewFirstName,model.NewLastName,account.Email,model.NewPassword);
                return new UpdateAccountResponseModel()
                {
                    Status = 2,
                    Message = "Cuenta Actualizada, se envio un correo con sus nuevos datos de usuario"
                };
            }
            return new UpdateAccountResponseModel()
            {
                Status = 0,
                Message = "Error con la cuenta"
            };
        }

        [AcceptVerbs("PUT")]
        [PUT("login")]
        public RestorePasswordResponseModel restorePassword([FromBody] ChangePassModel model)
        {
            var validateMessage = _restoreValidator.Validate(model);
            if (!String.IsNullOrEmpty(validateMessage))
            {
                return new RestorePasswordResponseModel()
                {
                    Message = validateMessage,
                    Status = 1
                };
            }
            Account account =
                _readOnlyRepository.First<Account>(
                    account1 => account1.Email == model.Email);
            
            if (account != null)
            {
                var encryptObj = new EncryptServices();
                encryptObj.GenerateKeys();
                var newPassword = Guid.NewGuid().ToString();
                account.Password = encryptObj.EncryptStringToBytes(newPassword, encryptObj.myRijndael.Key,
                    encryptObj.myRijndael.IV);
                account.EncryptKey = encryptObj.myRijndael.Key;
                account.EncryptIV = encryptObj.myRijndael.IV;
                _writeOnlyRepository.Update(account);
               // SendRestoreMessage(account.FirstName,account.FirstName,account.Email,newPassword);
                return new RestorePasswordResponseModel()
                {
                    Message = "Se acaba de enviar un mensaje al correo indicado, favor seguir las instrucciones",
                    Status = 2
                };
            }
           
            return new RestorePasswordResponseModel()
            {
                Message = "No existe ningun usuario registrado en MiniTrello | Web con ese correo",
                Status = 1
            };
        }

    }
}