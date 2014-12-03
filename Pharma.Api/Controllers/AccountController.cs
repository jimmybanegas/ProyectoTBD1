using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using AttributeRouting.Web.Mvc;
using AutoMapper;
using Microsoft.Ajax.Utilities;
using NHibernate;
using NHibernate.Transform;
using Pharma.Api.Controllers.AccountControllerHelpers;
using Pharma.Api.Models;
using Pharma.Domain.Entities;
using Pharma.Domain.Services;

namespace Pharma.Api.Controllers
{
    public class AccountController : ApiController
    {
        readonly IReadOnlyRepository _readOnlyRepository;
        readonly IWriteOnlyRepository _writeOnlyRepository;
        readonly IMappingEngine _mappingEngine;
        readonly ISession _session;
    
        public AccountController(IReadOnlyRepository readOnlyRepository, IWriteOnlyRepository writeOnlyRepository,
         IMappingEngine mappingEngine, ISession session)
        {
            _readOnlyRepository = readOnlyRepository;
            _writeOnlyRepository = writeOnlyRepository;
            _mappingEngine = mappingEngine;
            _session = session;
        }

        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("login")]
        public AuthenticationModel Login([FromBody] AccountLoginModel model)
        {
            var encryptObj = new EncryptServices();
         /*   account account =
                _readOnlyRepository.First<account>(
                    account1 => account1.Email == model.Email);*/

            var account = _session.QueryOver<account>().Where(c => c.Email == model.Email)
                .SingleOrDefault<account>();
          
            
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
                var token = "";

                var availabletime = new TimeSpan();

                var session = _session.QueryOver<sessions>()
                    .OrderBy(x => x.ExpirationTime).Desc
                    .JoinQueryOver(e => e.account)
                    // .WhereRestrictionOn(c => c.account.Email).IsLike(account.Email)
                    .Where(k => k.Email == account.Email).Take(1)
                    .SingleOrDefault<sessions>();

            /*    var session =
                    _readOnlyRepository.Query<sessions>(sessions1 => sessions1.user.Email == account.Email)
                        .OrderByDescending(x => x.ExpirationTime)
                        .FirstOrDefault();
             */
                if (session == null || session.ExpirationTime < DateTime.Now)
                {
                    var newsession = SetSessionsModel(account);

                    //sessions newsessionCreated = _writeOnlyRepository.Create(newsession);

                    var  newsessionCreated = _session.Save(newsession);

                    if (newsessionCreated != null)
                    {
                        token = newsession.Token;
                        availabletime = (newsession.ExpirationTime.Subtract(newsession.LoginDate));
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

        private sessions SetSessionsModel(account account)
        {
            var sessionLoging = new SessionsModel
            {
                Account =  account,
                LoginDate = DateTime.Now,
                ExpirationTime = DateTime.Now.AddHours(2),
                Token = Guid.NewGuid().ToString()
            };
            sessions sessionToReturn = _mappingEngine.Map<SessionsModel, sessions>(sessionLoging);
            return sessionToReturn;
        }

       [POST("register")]
        public AccountRegisterResponseModel Register([FromBody] AccountRegisterModel model)
        {
    
           var personNameList =_session.CreateSQLQuery("CALL sp_sel_tipo_cliente")
            .SetResultTransformer(Transformers.AliasToBean<tipo_cliente>())
            .List<tipo_cliente>()
            .ToList();

        //   PharmaMethodsExecutor.sp_ins_tipo_cliente(_session, mod.descripcion, mod.fecha_actu, mod.fecha_crea, mod.usuario_actu, mod.usuario_crea);
          // PharmaMethodsExecutor.sp_del_tipo_cliente(_session,6);
    
        
           // var validateMessage = _registerValidator.Validate(model);
            if (String.IsNullOrEmpty(model.Email))
            {
                return new AccountRegisterResponseModel
                {
                    Message = "Datos incorrectos",
                    Status = 1
                };
            }
           /* var accountExist =
                _readOnlyRepository.First<Account>(
                    account1 => account1.Email == model.Email);*/

            var accountExist = _session.QueryOver<account>().Where(c => c.Email == model.Email)
                            .SingleOrDefault<account>();


            if (accountExist == null)
            {
                var account = _mappingEngine.Map<AccountRegisterModel, account>(model);

                var encryptObj = new EncryptServices();
                encryptObj.GenerateKeys();
                account.Password = encryptObj.EncryptStringToBytes(account.Password, encryptObj.myRijndael.Key,
                    encryptObj.myRijndael.IV);
                account.EncryptKey = encryptObj.myRijndael.Key;
                account.EncryptIV = encryptObj.myRijndael.IV;
                
               // account accountCreated = _writeOnlyRepository.Create(account);

                var accountCreated = _session.Save(account);
             
                if (accountCreated != null)
                {
                   // SendSimpleMessage(accountCreated.FirstName, accountCreated.LastName, accountCreated.Email, model.Password);
                    return new AccountRegisterResponseModel(account.Email, account.FirstName, 2);
                }
                return new AccountRegisterResponseModel()
                {
                    Message = "Hubo un error al guardar el usuario",
                    Status = 0
                };
            
               
            }
           return new AccountRegisterResponseModel(model.Email, model.FirstName, 0);
          
        }

     /*
        
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
        }*/

    }
}