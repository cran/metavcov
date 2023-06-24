\name{md_lgor}
\alias{md_lgor}
\title{Computing Covariance between Mean Difference and Log Odds Ratio}
\author{
Min Lu
}
\usage{
md_lgor(r, n1c, n2c, n1t, n2t,
        n12c = min(n1c, n2c), n12t = min(n1t, n2t),
        s2c, s2t, f2c, f2t, sd1c, sd1t)
}
\description{
The function \code{lgor_rd} computes covariance between mean difference and log odds ratio.  See \code{\link{mix.vcov}} for effect sizes of the same or different types.
}
\arguments{
\item{r }{ Correlation coefficient of the two outcomes.}
\item{n1c }{ Number of participants reporting outcome 1 in the control group.}
\item{n2c }{ Number of participants reporting outcome 2 in the control group.}
\item{n1t }{ Number of participants reporting outcome 1 in the treatment group.}
\item{n2t }{ Number of participants reporting outcome 2 in the treatment group.}
\item{n12c }{ Number of participants reporting both outcome 1 and outcome 2 in the control group. By default, it is equal to the smaller number between \code{n1c} and \code{n2c}.}
\item{n12t }{ Number defined in a similar way as \code{n12c} for the treatment group. }
\item{s2c }{ Number of participants with event for outcome 2 (dichotomous) in the control group.}
\item{s2t }{ Defined in a similar way as \code{s2c} for the treatment group. }
\item{f2c }{ Number of participants without event for outcome 2 (dichotomous) in the control group.}
\item{f2t }{ Defined in a similar way as \code{f2c} for the treatment group. }
\item{sd1c }{ Sample standard deviation of outcome 1 for the control group.}
\item{sd1t }{ Defined in a similar way as \code{sd1c} for the treatment group.}
}

\value{
\item{lgor}{Log odds ratio for outcome 2.}
\item{v}{Computed covariance.}
}


\references{
Lu, M. (2023). Computing within-study covariances, data visualization, and missing data solutions for multivariate meta-analysis with metavcov. \emph{Frontiers in Psychology}, 14:1185012.
}

\examples{
## a simple example
md_lgor(r = 0.71, n1c = 34, n2c = 35, n1t = 25, n2t = 32,
        s2c = 5, s2t = 8, f2c = 30, f2t = 24, sd1t = 0.4, sd1c = 8)
## calculate covariances for variable SBP and DD in Geeganage2010 data
attach(Geeganage2010)
SBP_DD <- unlist(lapply(1:nrow(Geeganage2010), function(i){md_lgor(r = 0.71,
               n1c = nc_SBP[i], n2c = nc_DD[i], n1t = nt_SBP[i], n2t = nt_DD[i],
               sd1t = sdt_SBP[i], s2t = st_DD[i], sd1c = sdc_SBP[i], s2c = sc_DD[i],
               f2c = nc_DD[i] - sc_DD[i], f2t = nt_DD[i] - st_DD[i])$v}))
SBP_DD
## the function mix.vcov() should be used for dataset
}
