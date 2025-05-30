% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataComb.flexsurvreg.R
\name{dataComb.flexsurvreg}
\alias{dataComb.flexsurvreg}
\title{Function for cleaning the data of a model with class 'flexsurvreg'}
\usage{
\method{dataComb}{flexsurvreg}(CFM, DC, id = NULL, trt = NULL, cfmOb = FALSE)
}
\arguments{
\item{CFM}{a model object supplied to pscfit}

\item{DC}{a dataset including covariates to match the CFM}

\item{id}{a vector specifiying whether a subset of the dataset should be selected.
Defaults to 'NULL' e.g. all data points included}

\item{trt}{An optional additional vector denoting treatment allocations for multiple treatment comparisons.  Defaults to 'NULL'}

\item{cfmOb}{used to specify if a CFM object is supplies as the counter factual model}
}
\value{
a list containing objects which specifiy the required exported components
  of the model and a cleaned data cohort.
 Attributes include \itemize{
 \item{'model.type' specifying the class of model to be used as the CFM }
 \item{'model_extract' sepcifying the model componets required for estimation}
 \item{'cov' a cleaned dataset of covariates}
 \item{'outcome' a cleaned dataset containing the outcomes}
 }
}
\description{
The purpose of this function is to prepare the dataset and the counter-factual
model for estimation and is the first step pf the pscfit.R process. The output
is a complete-case dataset where the data names match the variables used in the CFM.
}
