\name{metavcov-package}
\alias{metavcov-package}
\alias{metavcov}
\docType{package}
\title{Variances and Covariances for Multivariate Meta-Analysis}
\description{
R package metavov computes variances and covariances for multivariate meta-analysis. Effect sizes include correlation (r), mean difference (MD), standardized mean difference (SMD), log odds ratio (logOR), log risk ratio (logRR), and risk difference (RD).}
\author{
Min Lu (Maintainer,<m.lu6@umiami.edu>)
}

\references{
    \tabular{l}{
Ahn, S., Lu, M., Lefevor, G.T., Fedewa, A. and Celimli, S. (2016). Chapter 11. Application of meta analysis in sport and exercise science. (pp. 233 253) In Ntoumanis, N. and Myers, N. (Eds.), An Introduction to Intermediate and Advanced Statistical Analyses for Sport and Exercise Scientists. John Wiley and Sons, Ltd.\cr
Olkin, Ingram. Asymptotic distribution of functions of a correlation matrix. Essays in provability and statistics: A volume in honor of Professor Junjiro Ogawa (1976).\cr
Wei, Yinghui, and Julian Higgins. Estimating within study covariances in multivariate meta analysis with multiple outcomes. Statistics in Medicine 32.7 (2013): 1191 1205.\cr
}}

\examples{
###############################################
# Effect size : correlation coefficients
###############################################
data(Craft2003)
computvocv=r.vcov(n=Craft2003$N,
                  corflat=subset(Craft2003, select=C1:C6),
                  method="average")
# name transformed z scores as an input
Input =computvocv$zr
# name variance covariance matrix of trnasformed z scores as covars
covars = computvocv$zcov
# Next step: Overall analysis: Running random effects model 
#                              using package "mvmeta"
#library(mvmeta)
#mvmeta_RE = summary(mvmeta(cbind(C1,C2,C3,C4,C5,C6),
#                           S=covars,data=Input,method="reml"))
#mvmeta_RE
}
