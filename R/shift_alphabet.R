#'
#' Perform a shift of a provided alphabet by the
#' number of provided characters
#'
#' @return returns the resulting alphabet

shift_alphabet <-
function(in_alphabet, shift) {
  # Rotates the input alphabet to the left by
  # 'shift' number of characters.
  #
  # Args:
  #   instring: the input alphabet to be shifted
  #
  # Returns:
  #   Returns the shifted alphabet

  len <- length(in_alphabet)
  out_alphabet <- c()
  for(loop in 0:(len-1))
  {
    out_alphabet <- c(out_alphabet, in_alphabet[((loop + shift) %% len) + 1])
  }
  return(out_alphabet)
}
