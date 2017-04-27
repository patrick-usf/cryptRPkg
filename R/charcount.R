#'
#' count the letter frequency of input string
#'
#' @return returns a frequency table

charcount <-
function (instring) {
  # Count instances of characters in an input string
  # by breaking down the input string in a vector of
  # single byte characters. Counts all non-alphabetic
  # characters as well; to only count alphabetic characters
  # use monogram_alpha()
  #
  # Args:
  #   instrings: the input string to be processed
  #
  # Returns:
  #   A table containing the frequency count of all characters,
  #   to include non-alpha characters.

  chared <- c()
  input_length <- nchar(instring)
  for(search in 1:input_length)
  {
    chared <- c(chared, substr(instring, search, search))
  }
  freq_table <- table(chared)
  return(freq_table)
}
