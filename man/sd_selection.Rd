% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BioTIP_update_3.3_02282020.R
\name{sd_selection}
\alias{sd_selection}
\title{Selecting Highly Oscillating Transcripts}
\usage{
sd_selection(
  df,
  samplesL,
  cutoff = 0.01,
  method = c("other", "reference", "previous", "itself", "longitudinal reference"),
  control_df = NULL,
  control_samplesL = NULL
)
}
\arguments{
\item{df}{A numeric matrix or data frame. The rows and columns represent
unique transcript IDs (geneID) and sample names, respectively.}

\item{samplesL}{A list of vectors,  whose length is the number of states. Each
vector gives the sample names in a state. Note that the vectors (sample names) has
to be among the column names of the R object 'df'.}

\item{cutoff}{A positive numeric value. Default is 0.01. If < 1,
automatically selects top x  transcripts using the a selecting
method (which is either the \code{reference},  \code{other} stages or \code{previous}
stage),  e.g. by default it will select top 1 percentage of the transcripts.}

\item{method}{Selection of methods from \code{reference},\code{other}, \code{previous},
default uses \code{other}. Partial match enabled.
\itemize{
\item \code{itself}, or \code{longitudinal reference}. Some specific requirements for each
option:
\item \code{reference},  the reference has to be the first.
\item \code{previous},  make sure \code{sampleL} is in the right order from benign to malign.
\item \code{itself},  make sure the cutoff is smaller than 1.
\item \code{longitudinal reference} make sure \code{control_df} and \code{control_samplesL} are not NULL.
The row numbers of control_df is the same as df and all transcripts in df are also in control_df.
}}

\item{control_df}{A count matrix with unique loci as row names and samples names
of control samples as column names,  only used for method \code{longitudinal reference}}

\item{control_samplesL}{A list of characters with stages as names of control
samples,  required for method 'longitudinal reference'}
}
\value{
\code{sd_selection()} A list of data frames,  whose length is the number
of states. The rows in each data frame are the filtered transcripts with
highest standard deviation selected from \code{df} and based on an assigned cutoff
value. Each resulting data frame represents a subset of the raw
input \code{df},  with the sample ID of the same state in the column.
}
\description{
\code{sd_selection} pre-selects highly oscillating transcripts
from the input dataset \code{df}. The dataset must contain multiple sample
groups (or 'states'). For each state,  the function filters the dataset using
a cutoff value for standard deviation. The default cutoff value is 0.01
(i.e., higher than the top 1 percentage standard deviation).
}
\examples{
counts = matrix(sample(1:100, 18), 2, 9)
colnames(counts) = 1:9
row.names(counts) = c('loci1', 'loci2')
cli = cbind(1:9, rep(c('state1', 'state2', 'state3'), each = 3))
colnames(cli) = c('samples', 'group')
samplesL <- split(cli[, 1], f = cli[, 'group'])
test_sd_selection <- sd_selection(counts,  samplesL,  0.01)

}
\seealso{
\code{\link{optimize.sd_selection}}
}
\author{
Zhezhen Wang \email{zhezhen@uchicago.edu}
}
