% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/join_names.R
\name{join_names}
\alias{join_names}
\title{Join names for aggregations}
\usage{
join_names(agr)
}
\arguments{
\item{agr}{string. Aggregation level. 'mun' for municipalities, 'uf' for "unidades federativas" or 'regsaude' for "regiões de saúde".}
}
\value{
Returns a string vector with join names for aggregation levels.
}
\description{
It is a auxiliary function.
}
\examples{
join_names <- join_names(agr = "mun")
}
