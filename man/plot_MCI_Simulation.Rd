% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BioTIP_update_3.3_02282020.R
\name{plot_MCI_Simulation}
\alias{plot_MCI_Simulation}
\title{Plot observed and simulated MCI Scores}
\usage{
plot_MCI_Simulation(
  MCI,
  simulation,
  las = 0,
  order = NULL,
  ylim = NULL,
  main = NULL,
  which2point = NULL,
  ...
)
}
\arguments{
\item{MCI}{A named vector of max CI scores per state, can be obtained from function \code{\link{getMaxStats}}.}

\item{simulation}{A matrix state * number of simulated times,  can be obtained from function \code{\link{simulationMCI}}.}

\item{las}{Numeric in {0, 1, 2, 3}; the style of axis labels. Default is 0, meaning labels are parallel.
(link to http://127.0.0.1:21580/library/graphics/html/par.html)}

\item{order}{A vector of state names in the customized order to be plotted, set to NULL by default.}

\item{ylim}{An integer vector of length 2. Default is NULL.}

\item{main}{A character vector. The title of the plot. Default is NULL.}

\item{which2point}{A character (or integer) which state's values were used to set up the three horizontal lines.
by default is NULL,  indicating the values of all states will be used.}

\item{...}{Other parameters passed to this function}
}
\value{
Return a box plot of MCI(red) and simulated MCI(grey) scores per state.
}
\description{
Box plots of observed (red) and simulated MCI scores by boostraping genes \code{B} times,
with three horizontal lines: the min,  max and 2*(max-min) value of the state of interests, or all all values.
}
\examples{
MCI = c(1:3); names(MCI) = c('a', 'b', 'c')
simMCI = matrix(sample(1:100, 9), 3, 3)
row.names(simMCI) = names(MCI)
plot_MCI_Simulation(MCI, simMCI)

}
\author{
Zhezhen Wang \email{zhezhen@uchicago.edu}
}
