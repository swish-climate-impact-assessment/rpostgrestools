
###########################################################################
# newnode: getPassword
getPassword <- function(remote = F){
  if(remote == F){
   require(tcltk)
   tt <- tktoplevel()
   pass=tclVar('')
   label.widget <- tklabel(tt, text='Enter Password')
   password.widget <- tkentry(tt,show='*',textvariable=pass)
   ok <- tkbutton(tt,text='Ok',command=function()tkdestroy(tt))
   tkpack(label.widget, password.widget,ok)
   tkwait.window(tt)
   return(tclvalue(pass))
 } else {
   pass <- readline('Type your password into the console: ')
   return(pass)
 }
}


# pwd <- getPassword()
