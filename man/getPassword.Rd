
\name{getPassword}
\alias{getPassword}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
getPassword
}
\description{
getPassword
}
\usage{
getPassword(remote = F)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{remote}{
%%     ~~Describe \code{remote} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
ivanhanigan
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--    or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (remote = F) 
{
    if (remote == F) {
        require(tcltk)
        tt <- tktoplevel()
        pass = tclVar("")
        label.widget <- tklabel(tt, text = "Enter Password")
        password.widget <- tkentry(tt, show = "*", textvariable = pass)
        ok <- tkbutton(tt, text = "Ok", command = function() tkdestroy(tt))
        tkpack(label.widget, password.widget, ok)
        tkwait.window(tt)
        return(tclvalue(pass))
    }
    else {
        pass <- readline("Type your password into the console: ")
        return(pass)
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
