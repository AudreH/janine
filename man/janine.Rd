% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/janine.R
\name{janine}
\alias{janine}
\title{Janine: Just Another Network Infernce mEthod}
\usage{
janine(
  data,
  partition = NULL,
  n_blocks = NULL,
  penalties = NULL,
  alpha = 0,
  control_optim = list(),
  control_penalties = list()
)
}
\arguments{
\item{data}{a n x d matrix of multivariate Gaussian observation}

\item{partition}{a factor indicating a known partition of the variables to be respected during the clustering.
If NULL (the default), to predfined partition is consider.}

\item{n_blocks}{integer for the target number of groups. If NULL (the default), will be chosen automatically internally by ICL in the SBM fit.}

\item{penalties}{a vector of postive real number in decreasing order tuning the network sparsity. The default (NULL) generates
an hopefully appropriate collection of penalties.}

\item{alpha}{a positive scalar tuning the mixture between the weighted-sparse penlaty and the trace-Laplacian regularisation.}

\item{control_optim}{a list controling how the alternate optimization between adaptive graphical-Lasso and SBM is conducted
for each penalty level. Contains three entries: a convergence threshold \code{epsilon} (default to 1e-3),
a maximal number of iteration \code{max_iter} (default 20) and verbosity level \code{trace} (default 1).}

\item{control_penalties}{a list controling how \code{penalties} is generated, with three entries:
a double \code{min_ratio} (default 0.1), a integer \code{length} (default 20) and a logical \code{diagonal} (default TRUE)
indicating weither the diaognal should be penalized or not.}
}
\description{
Iterate Adaptive Graphical-Lasso with binary SBM estimation to recover the adaptive weights
}
\examples{
## Network settting
nNodes  <- 60
blockProp <- c(1/3, 1/3, 1/3)   # group proportions
nbBlock   <- length(blockProp) # number of blocks
connectParam <- diag(.4, nbBlock) + 0.01 # connectivity matrix: affiliation network
mySBM <- rggm::rSBM(nNodes, connectParam, blockProp)
Omega <- rggm::graph2prec(mySBM, cond_var = rep(1, nNodes), neg_prop = 0.5)
## Multivariate Gaussian Vector generation
n <- 300
X <- rggm::rmgaussian(n, means = rep(0, nNodes), solve(Omega))
## Network inference
fits <- janine(X, penalties = 0.1, control_optim = list(n_cores = 1))
plot(fits$models[[1]])
}
