\name{metafixed}
\alias{metafixed}
\alias{print.summary.metafixed}
\alias{summary.metafixed}
\alias{maketable}
\title{Fitting Fixed-Effect Meta-Analysis Models}
\author{
Min Lu
}
\usage{
metafixed(y, Slist)
}
\description{
The function \code{metafixed} performs fixed-effects multivariate meta-analysis with the generalized least squares (GLS) method.
}
\arguments{
\item{y }{ A \eqn{N \times p}{N x p} matrix or data frame that stores effect sizes from \eqn{N} primary studies. Usually the output value \code{ef} produced by \code{\link{r.vcov}} for correlation coefficients or \code{\link{mix.vcov}} for other types of effect sizes. }
\item{Slist }{ A \eqn{N}-dimensional list of \eqn{p(p+1)/2 \times p(p+1)/2}{p(p+1)/2 x p(p+1)/2} matrices that stores within-study (co)variance matrices of the estimated effect sizes for each one of the \eqn{N} studies. Usually the output value \code{list.vcov} produced by \code{\link{r.vcov}} for correlation coefficients or \code{\link{mix.vcov}} for other types of effect sizes. }
}

\details{
Estimators were calculated from the generalized least squares approach.
}
\value{
The \code{metafixed} function typically returns a list object of class "metafixed" representing the meta-analytical model. Use the \code{summary} function to check the analysis results.  }

\references{
Lu, M. (2023). Computing within-study covariances, data visualization, and missing data solutions for multivariate meta-analysis with metavcov. \emph{Frontiers in Psychology}, 14:1185012.

Cooper, H., Hedges, L.V., & Valentine, J.C. (Eds.) (2009). \emph{The handbook of research synthesis and
meta-analysis.} New York: Russell Sage Foundation.
}
\examples{
######################################################
# Example: Craft2003 data
# Preparing covariances for multivariate meta-analysis
######################################################
data(Craft2003)
computvcov <- r.vcov(n = Craft2003$N,
                     corflat = subset(Craft2003, select = C1:C6),
                     method = "average")
y <- computvcov$ef
Slist <- computvcov$list.vcov
#####################################################
# Running fixed-effects model using "metafixed"
#####################################################
MMA_FE <- summary(metafixed(y = y, Slist = Slist))
MMA_FE$coefficients
##############################################################
# Plotting the result:
##############################################################
plotCI(y = computvcov$ef, v = computvcov$list.vcov,
        name.y = NULL, name.study = Craft2003$ID,
        y.all = MMA_FE$coefficients[,1],
        y.all.se = MMA_FE$coefficients[,2],
        up.bound = Inf, low.bound = -Inf)
}
