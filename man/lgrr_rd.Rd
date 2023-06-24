\name{lgrr_rd}
\alias{lgrr_rd}
\title{Computing Covariance between Log Risk Ratio and Risk Difference}
\author{
Min Lu
}
\usage{
lgrr_rd(r, n1c, n2c, n1t, n2t,
        n12c = min(n1c, n2c),
        n12t = min(n1t, n2t),
        s2c, s2t, f2c, f2t,
        s1c, s1t, f1c, f1t)
}
\description{
The function \code{lgrr_rd} compute covariance between log risk ratio and risk difference, when the two outcomes are binary. See \code{\link{mix.vcov}} for effect sizes of the same or different types.
}
\arguments{
\item{r }{ Correlation coefficient of the two outcomes.}
\item{n1c }{ Number of participants reporting outcome 1 in the control group.}
\item{n2c }{ Number of participants reporting outcome 2 in the control group.}
\item{n1t }{ Number of participants reporting outcome 1 in the treatment group.}
\item{n2t }{ Number of participants reporting outcome 2 in the treatment group.}
\item{n12c }{ Number of participants reporting both outcome 1 and outcome 2 in the control group. By default, it is equal to the smaller number between \code{n1c} and \code{n2c}.}
\item{n12t }{ Defined in a similar way as \code{n12c} for the treatment group. }
\item{s2c }{ Number of participants with event for outcome 2 (dichotomous) in the control group.}
\item{s2t }{ Defined in a similar way as \code{s2c} for the treatment group. }
\item{f2c }{ Number of participants without event for outcome 2 (dichotomous) in the control group. }
\item{f2t }{ Defined in a similar way as \code{f2c} for the treatment group. }
\item{s1c }{ Number of participants with event for outcome 1 (dichotomous) in the control group.}
\item{s1t }{ Defined in a similar way as \code{s1c} for the treatment group. }
\item{f1c }{ Number of participants without event for outcome 1 (dichotomous) in the control group.}
\item{f1t }{ Defined in a similar way as \code{f1c} for the treatment group. }
}

\value{
\item{lgrr}{Log risk ratio for outcome 1.}
\item{rd}{Risk difference for outcome 1.}
\item{v}{Computed covariance.}
}


\references{
Lu, M. (2023). Computing within-study covariances, data visualization, and missing data solutions for multivariate meta-analysis with metavcov. \emph{Frontiers in Psychology}, 14:1185012.
}

\examples{
## simple example
lgrr_rd(r = 0.71, n1c = 30, n2c = 35, n1t = 28, n2t = 32,
        s2c = 5, s2t = 8, f2c = 30, f2t = 24,
        s1c = 5, s1t = 8, f1c = 25, f1t = 20)
## calculate covariances for variable D and DD in Geeganage2010 data
attach(Geeganage2010)
D_DD <- unlist(lapply(1:nrow(Geeganage2010), function(i){lgrr_rd(r = 0.71,
        n1c = nc_SBP[i], n2c = nc_DD[i],
        n1t = nt_SBP[i], n2t = nt_DD[i], s2t = st_DD[i], s2c = sc_DD[i],
        f2c = nc_DD[i] - sc_DD[i], f2t = nt_DD[i] - st_DD[i],
        s1t = st_D[i], s1c = sc_D[i], f1c = nc_D[i] - sc_D[i], f1t = nt_D[i] - st_D[i])$v}))
D_DD
## the function mix.vcov() should be used for dataset
}
