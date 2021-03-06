% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/code_forpackage.R
\name{ordered_categ}
\alias{ordered_categ}
\title{ordered_cat}
\usage{
ordered_categ(train, j, data)
}
\arguments{
\item{train}{a random sample from data}

\item{j}{the number of categorical variables in the dataset}

\item{data}{a data.frame with categorical and continuous variables and a binary response (in that order)}
}
\description{
A method to cluster categorical variables using Logistic regression.
}
\details{
There are three functions, ordered_categ gives the order of the categorical variables given by the order of the coefficients of a logistic regression
feasible_clusterings gives a set of feasible ways to cluster together the categories of the categorical variables in two groups each (one dummy), clustered_model
gives the final dataset with the clustered categorical variables. For more details see
Carrizosa, E., Galvis Restrepo, M., and Romero Morales, D. (2019). On clustering categories of categorical predictors in generalized linear models. Working paper, Copenhagen Business School.
}
