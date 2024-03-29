% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DummyHierarchies.R
\name{DummyHierarchy}
\alias{DummyHierarchy}
\alias{DummyHierarchies}
\title{Converting hierarchy specifications to a (signed) dummy matrix}
\usage{
DummyHierarchy(
  mapsFrom,
  mapsTo,
  sign,
  level,
  mapsInput = NULL,
  inputInOutput = FALSE,
  keepCodes = mapsFrom[integer(0)],
  unionComplement = FALSE,
  reOrder = FALSE
)

DummyHierarchies(
  hierarchies,
  data = NULL,
  inputInOutput = FALSE,
  unionComplement = FALSE,
  reOrder = FALSE
)
}
\arguments{
\item{mapsFrom}{Character vector from hierarchy table}

\item{mapsTo}{Character vector from hierarchy table}

\item{sign}{Numeric vector of either 1 or -1 from hierarchy table}

\item{level}{Numeric vector from hierarchy table}

\item{mapsInput}{All codes in mapsFrom not in mapsTo (created automatically when NULL) and possibly other codes in input data.}

\item{inputInOutput}{When FALSE all output rows represent codes in mapsTo}

\item{keepCodes}{To prevent some codes to be removed when inputInOutput = FALSE}

\item{unionComplement}{When TRUE, sign means union and complement instead of addition or subtraction (see note)}

\item{reOrder}{When TRUE (FALSE is default) output codes are ordered differently, more similar to a usual model matrix ordering.}

\item{hierarchies}{List of hierarchies}

\item{data}{data}
}
\value{
A sparse matrix with row and column and names
}
\description{
A matrix for mapping input codes (columns) to output codes (rows) are created.
The elements of the matrix specify how columns contribute to rows.
}
\details{
\code{DummyHierarchies} is a user-friendly wrapper for the original function \code{DummyHierarchy}.
Then, the logical input parameters are vectors (possibly recycled).
\code{mapsInput} and \code{keepCodes} can be supplied as attributes.
\code{mapsInput} will be generated when \code{data} is non-NULL.
}
\note{
With unionComplement = FALSE (default), the sign of each mapping specifies the contribution as addition or subtraction.
Thus, values above one and negative values in output can occur.
With unionComplement = TRUE,  positive is treated as union and negative as complement. Then 0 and 1 are the only possible elements in the output matrix.
}
\examples{
# A hierarchy table
h <- SSBtoolsData("FIFA2018ABCD")

DummyHierarchy(h$mapsFrom, h$mapsTo, h$sign, h$level)
DummyHierarchy(h$mapsFrom, h$mapsTo, h$sign, h$level, inputInOutput = TRUE)
DummyHierarchy(h$mapsFrom, h$mapsTo, h$sign, h$level, keepCodes = c("Portugal", "Spain"))

# Extend the hierarchy table to illustrate the effect of unionComplement
h2 <- rbind(data.frame(mapsFrom = c("EU", "Schengen"), mapsTo = "EUandSchengen", 
                       sign = 1, level = 3), h)

DummyHierarchy(h2$mapsFrom, h2$mapsTo, h2$sign, h2$level)
DummyHierarchy(h2$mapsFrom, h2$mapsTo, h2$sign, h2$level, unionComplement = TRUE)

# Extend mapsInput - leading to zero columns.
DummyHierarchy(h$mapsFrom, h$mapsTo, h$sign, h$level,
               mapsInput = c(h$mapsFrom[!(h$mapsFrom \%in\% h$mapsTo)], "Norway", "Finland"))

# DummyHierarchies
DummyHierarchies(FindHierarchies(SSBtoolsData("sprt_emp_withEU")[, c("geo", "eu", "age")]), 
                 inputInOutput = c(FALSE, TRUE))
}
\author{
Øyvind Langsrud
}
