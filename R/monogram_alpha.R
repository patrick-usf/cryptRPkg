#'
#' perform a frequency count of only alphabetic characters
#'
#' @return returns a frequency table

monogram_alpha <-
function(inalphabet){
  # Calculates the alphabetic monogram frequency for an input
  # string and returns a table containing the results. All
  # alphabetic characters are normalized to uppecase.
  #
  # Args:
  #   inalphabet: String to be processed
  #
  # Returns:
  #   Table containing the monogram frequency counts for each
  #   alphabetic character in the string.

  monogram <- vector()
  x <- toupper(inalphabet)
  for (i in 1:nchar(inalphabet)) {
    current <- substr(inalphabet,i,i)
    if( current %in% LETTERS) {
      monogram <- append(monogram, current)
    }
  }
  return(table(monogram))
}
