% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FormulaSums.R
\name{FormulaSums}
\alias{FormulaSums}
\title{Sums (aggregates) and/or sparse model matrix with possible cross table}
\usage{
FormulaSums(data, formula, makeNames = TRUE, crossTable = FALSE,
  total = "Total", printInc = TRUE, dropResponse = FALSE,
  makeModelMatrix = NULL, sep = "-", sepCross = ":")
}
\arguments{
\item{data}{data frame}

\item{formula}{A model formula}

\item{makeNames}{Column/row names made when TRUE}

\item{crossTable}{Cross table in output when TRUE}

\item{total}{String used to name totals}

\item{printInc}{Printing "..." to console when TRUE}

\item{dropResponse}{When TRUE response part of formula ignored.}

\item{makeModelMatrix}{Make model matrix when TRUE. NULL means automatic.}

\item{sep}{String to separate when creating column names}

\item{sepCross}{String to separate when creating column names involving crossing}
}
\value{
A matrix of sums, a sparse model matrix or a list of three elements (model matrix, cross table and sums).
}
\description{
By default this function return sums if the formula contains a response part and a model matrix otherwise
}
\details{
The model matrix is constructed by calling fac2sparse() repeatedly. The sums are computed by calling aggregate() repeatedly.
Hierarchical variables handled when constructing cross table.
Column names constructed from the cross table.
}
\examples{
x <- SSBtoolsData("sprt_emp_withEU")

FormulaSums(x, ths_per ~ year*geo + year*eu)
FormulaSums(x, ~ year*age*eu)
FormulaSums(x, ths_per ~ year*age*geo + year*age*eu, crossTable = TRUE, makeModelMatrix = TRUE)
FormulaSums(x, ths_per ~ year:age:geo -1)
}
\author{
Øyvind Langsrud
}