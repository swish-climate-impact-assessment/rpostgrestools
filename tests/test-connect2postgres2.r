
################################################################
# name:connect2postgres2
  source("R/LinuxOperatingSystem.r")
  source("R/get_pgpass.r")
  source("R/get_passwordTable.r")
  source("R/connect2postgres.r")
  source("R/connect2postgres2.r")

#  debug(connect2postgres2)
#  ch <- connect2postgres2("ewedb", "115.146.84.135", "ivan_hanigan")
#  dbGetQuery(ch, 'select * from dbsize')
#  debug(connect2postgres2)
  ch <- connect2postgres2("gislibrary")
  dbGetQuery(ch, 'select * from dbsize')
