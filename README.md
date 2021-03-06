
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Janine: Just Another Network INference mEthod ?

[![Travis build
status](https://travis-ci.org/jchiquet/janine.svg?branch=master)](https://travis-ci.org/jchiquet/janine)

The goal of janine is to perform network reconstruction by estimating
the support of the precision matrix in a Gaussian graphical model, with
the additional assumption that the underlying graph is organized
according to a Stochastic Block Model (SBM). This SBM can possibly be
multipartite when the target network concerns entities of different
natures (like proteins and genes in genomics, or bacteria and fungi in
microbial ecology), but associated to the same individuals (samples of
patients or plant ecosystem for instance).

To adjust the model, with us weighted sparse technique possibly coupled
with graph-Laplacian-guided regularization. The weigths and the
graph-Laplacian are themselves estiamted with SBMs, in an iterative
process.

## Installation

You can install the development version of janine from github

``` r
remotes::install_github("jchiquet/janine")
```

## Reference

Janine is a self private joke/reference to an older R package called
[simone](https://cran.r-project.org/package=simone), which has the same
idea of driving network inference according to an underlying latent and
unobserved organization of the network. We use a different rationale
here which is more efficient and generalize to a wider class of SBM, in
particular multipartite SBM.
