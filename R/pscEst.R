#' Function for performing estimation procedures in 'pscfit'
#' @param CFM a model object supplied to pscfit
#' @param DC_clean a cleaned dataset ontained using dataComb().
#' @param nsim the number of MCMC simulations to run
#' @param start the stating value for
#' @param start.se the stating value for
#' @param trt an optional vector denoting treatment allocations where mulitple
#'     treatment comparisons are bieng made
#' @return A matrix containing the draws form the posterior distribution
#' @details
#'
#' Define the set of model parameters \eqn{B} to contain \eqn{\Gamma} which summarize
#' the parameters of the CFM. Prior distributions are defined for B using a
#' multivariate normal distribution \eqn{\pi (B) \sim MVN(\mu ,\Sigma)} where \eqn{\mu|}
#' is the vector of coefficient estimates from the validated model and \eqn{\Sigma}
#' is the variance-covariance matrix. This information is taken directly from the
#' outputs of the parametric model and no further elicitation is required.
#' The prior distirbution for the efficacy parameter (\eqn{\pi{(\beta)}}) is set
#' as an uniformative \eqn{N(0,1000)}.
#'
#' Ultimately the aim is to estimate the posterior distribution for \eqn{\beta} conditional
#' on the distribution of B and the observed data.  A full form for the posterior
#' distribution is then given as
#'
#' \deqn{P(\beta \vert B,D) \propto L(D \vert B,\beta) \pi(B) \pi(\beta)}
#'
#' Please see 'pscfit' for more details on liklihood formation.
#'
#' For each iteration of the MCMC procedure, the following algorithm is performed \enumerate{
#'
#' \item{Set and indicator s=1, and define an initial state based on prior
#' hyperparameters for \eqn{\pi(B)}  and \eqn{\pi(\beta)} such that \eqn{b_s = \mu and \tau_s=0}}
#'
#' \item{Update \eqn{s = s+1} and draw model parameters \eqn{b_s} from \eqn{\pi(B)} and an draw a
#' proposal estimate of \eqn{\beta} from some target distribution}
#'
#' \item{Estimate \eqn{\Gamma_(i,S)=\nu^T x_i} where \eqn{\nu} is the subset of parameters from \eqn{b_s}
#'  which relate to the model covariates and define 2 new likelihood functions
#'    \eqn{\Theta_(s,1)=L(D \vert B=b_s,\beta=\tau_(s-1) )} & \eqn{\Theta_(s,2)= L(D \vert B=b_s,\beta=\tau_s)}}
#'
#' \item{Draw a single value \eqn{\psi} from a Uniform (0,1) distribution and estimate
#' the condition \eqn{\omega=  \Theta_(s,1)/\Theta_(s,2)}. If \eqn{\omega > \psi} then accept \eqn{\tau_s} as belonging
#' to the posterior distribution \eqn{P(\beta \vert B,D)} otherwise retain \eqn{\tau_(s-1)}}
#'
#' \item{Repeat steps 2 – 4 for the required number of iterations}
#'
#'}
#' The result of the algorithm is a posterior distribution for the log hazard ratio,
#' \eqn{\beta}, captures the variability in B through the defined priors \eqn{\pi{(\beta)}}.
pscEst <- function(CFM, DC_clean, nsim, start, start.se, trt){
  UseMethod("pscEst")
}
