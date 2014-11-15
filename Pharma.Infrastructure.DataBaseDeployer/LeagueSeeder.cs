using DomainDrivenDatabaseDeployer;
using NHibernate;
using System.Collections.Generic;
using Pharma.Domain.Entities;

namespace Pharma.Infrastructure.DataBaseDeployer
{
    public class LeagueSeeder : IDataSeeder
    {
        private readonly ISession _session;

        public LeagueSeeder(ISession session)
        {
            _session = session;
        }

        public void Seed()
        {
            List<League> leagues = new List<League>(){
                new League(){
                        IsArchived = false,
                        Name = "Honduran Liga Nacional",
                        Country = "Honduras",
                        Teams = new List<Team>(){
                                new Team(){
                                    IsArchived = false,
                                    Name = "Olimpia"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Marathon"
                                    },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Motagua"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Real España"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Victoria"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Vida"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Plantense"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Real Sociedad"
                                }
                            }
                    },
                    new League(){
                        IsArchived = false,
                        Name = "Spanish La Liga",
                        Country = "Spain",
                        Teams = new List<Team>(){
                                new Team(){
                                    IsArchived = false,
                                    Name = "Real Madrid FC"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "FC Barcelona"
                                    },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Valencia"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Villareal"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Sevilla FC"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Real Sociedad"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Malaga"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Atletico Madrid"
                                }
                            }
                    },
                    new League(){
                        IsArchived = false,
                        Name = "English Premier League",
                        Country = "England",
                        Teams = new List<Team>(){
                                new Team(){
                                    IsArchived = false,
                                    Name = "Manchester United"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Chelsea FC"
                                    },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Everton"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Arsenal"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Manchester City"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Liverpool"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Tottenham Hotspur"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "New Castle"
                                }
                            }
                    },
                    new League(){
                        IsArchived = false,
                        Name = "Italian Serie A",
                        Country = "Italy",
                        Teams = new List<Team>(){
                                new Team(){
                                    IsArchived = false,
                                    Name = "Roma"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Juventus"
                                    },
                                new Team(){
                                    IsArchived = false,
                                    Name = "AC Milan"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Internazionale"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Caigliari"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Lazzio"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Palermo"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Torino"
                                }
                            }
                    },
                    new League(){
                        IsArchived = false,
                        Name = "German Bundesliga",
                        Country = "Germany",
                        Teams = new List<Team>(){
                                new Team(){
                                    IsArchived = false,
                                    Name = "Bayern München"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Borussia Dortmund"
                                    },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Schalke 04"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Hannover 96"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Stuttgart"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Wolfsburg"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Werder Bremen"
                                },
                                new Team(){
                                    IsArchived = false,
                                    Name = "Köln"
                                }
                            }
                    },
            };

            foreach (League league in leagues)
            {
                _session.Save(league);
            }
        }
    }
}