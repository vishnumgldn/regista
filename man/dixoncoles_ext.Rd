% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dixoncoles.R
\name{dixoncoles_ext}
\alias{dixoncoles_ext}
\title{A generic Dixon-Coles model for estimating team strengths}
\usage{
dixoncoles_ext(f1, f2, weights, data, init = NULL, ...)
}
\arguments{
\item{f1}{A formula describing the model for home goals.}

\item{f2}{A formula describing the model for away goals.}

\item{weights}{A formula describing an expression to calculate the weight for
each game.}

\item{data}{Data frame, list or environment (or object coercible by
`as.data.frame` to a data frame) containing the variables in the model.}

\item{init}{Initial parameter values. If it is `NULL`, 0 is used for all
values.}

\item{...}{Arguments passed onto `optim`.}
}
\value{
A list with component `par` containing the best set of parameters
  found. See `optim` for details.
}
\description{
This is an implementation of the Dixon-Coles model for estimating soccer
teams' strength from goals scored and conceded:

Dixon, Mark J., and Stuart G. Coles. "Modelling association football scores
and inefficiencies in the football betting market." Journal of the Royal
Statistical Society: Series C (Applied Statistics) 46, no. 2 (1997):
265-280.

By specifying the model as a pair of formulas, it allows the user to
estimate the effect of parameters beyond team strength.
}
\examples{
fit <- dixoncoles_ext(hgoal ~ off(home) + def(away) + hfa + 0,
                      agoal ~ off(away) + def(home) + 0,
                      weights = 1,  # All games weighted equally
                      data = premier_league_2010)
}
