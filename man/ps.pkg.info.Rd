\name{ps.pkg.info}
\alias{ps.pkg.info}
\title{RTutor Problem Set Package Information}
\description{
Returns information about the RTutor problem sets contained in this package.
}
\usage{
ps.pkg.info()
}
\value{
A list with two components:
\item{package}{The name of the RTutor package.}
\item{ps}{A character vector containing the names of the problem sets included
in the package.}
}
\details{
This function provides package information used by RTutor to identify the
problem sets included in this package.
}
\keyword{internal}