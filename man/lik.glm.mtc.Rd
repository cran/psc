% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lik.glm.mtc.R
\name{lik.glm.mtc}
\alias{lik.glm.mtc}
\title{Likelihood function for a psc model of class 'glm' with multiple
treatment comparisons}
\usage{
lik.glm.mtc(beta, DC_clean)
}
\arguments{
\item{beta}{a parameter to be estimate}

\item{DC_clean}{a cleaned dataset including covariates to match the CFM}
}
\description{
A function which defines the likelihood for a PSC model where the Counter
Factual Model (CFM) takes the form of a 'glm' object and a mulitple efficacy
parameters (\eqn{\beta}) is being estimated.  For more details on fitting please see
?pscfit and ?pscEst
}
\details{
A likelihood function for use by pscfit for a model of class 'flexsurvreg'
    where multiple treatment comparisons are required
}
