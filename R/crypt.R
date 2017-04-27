#'
#' encrypt/decrypt a provided string using
#' the provided alphabet
#'
#' @return returns output_string

crypt <-
function(instring, alphabet){
  # Encrypt or decrypt an input string based on
  # a provided alphabet. The crypt() function
  # can encrypt or decrypt depending on the
  # alphabet argument.
  #
  # Args:
  #   instring: the input to be translated
  #   alphabet: the alphabet to translate the input
  #
  # Returns:
  #   A string containing the translated input.

  outstring <- c()
  input_length <- nchar(instring)
  for(search in 1:input_length)
  {
    current_pos <- substr(instring, search, search)
    ciphered <- alphabet[[current_pos]]
    outstring <- paste(outstring, ciphered, sep = "")
  }
  return(outstring)
}
