\name{smd_rd}
\alias{smd_rd}
\title{Computing Covariance between Standardized Mean Difference and Risk Difference}
\author{
Min Lu
}
\usage{
smd_rd(d, r, n1c, n2c, n1t, n2t,
       n12c = min(n1c, n2c), n12t = min(n1t, n2t),
       s2c, s2t, f2c, f2t, sd1c, sd1t)
}
\description{
The function \code{smd_rd} computes covariance between standardized mean difference and risk difference.  See \code{\link{mix.vcov}} for effect sizes of the same or different types.
}
\arguments{
\item{d }{ Standardized mean difference for outcome 1.}
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
 \tabular{ll}{
  g \tab Computed Hedge's g from the input argument \code{d} for outcome 1.\cr
  rd \tab Computed risk difference for outcome 1.\cr
  v \tab Computed covariance.\cr}
}


\references{
Ahn, S., Lu, M., Lefevor, G.T., Fedewa, A. & Celimli, S. (2016). Application of meta-analysis in sport and exercise science. In N. Ntoumanis, & N. Myers (Eds.), \emph{An Introduction to Intermediate and Advanced Statistical Analyses for Sport and Exercise Scientists} (pp.233-253). Hoboken, NJ: John Wiley and Sons, Ltd.

Wei, Y., &  Higgins, J. (2013). Estimating within study covariances in multivariate meta-analysis with multiple outcomes. \emph{Statistics in Medicine, 32}(7), 119-1205.
}

\examples{
## simple example
smd_rd(d = 1, r = 0.71, n1c = 34, n2c = 35, n1t = 25, n2t = 32,
       s2c = 5, s2t = 8, f2c = 30, f2t = 24, sd1t = 0.4, sd1c = 8)
## calculate covariances for variable SBP and DD in Geeganage2010 data
attach(Geeganage2010)
SBP_DD <- unlist(lapply(1:nrow(Geeganage2010), function(i){smd_rd(d = SMD_SBP, r = 0.71,
                n1c = nc_SBP[i], n2c = nc_DD[i], n1t = nt_SBP[i], n2t = nt_DD[i],
                sd1t = sdt_SBP[i], s2t = st_DD[i], sd1c = sdc_SBP[i], s2c = sc_DD[i],
                f2c = nc_DD[i] - sc_DD[i], f2t = nt_DD[i] - st_DD[i])}))
SBP_DD
## the function mix.vcov() should be used for dataset
}
