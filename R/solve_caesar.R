#'
#' Perform a brute force search on all alphabet
#' shifts and test for possible solution based on
#' chi square results compared to a provided
#' alphabet frequency distribution
#'
#' @return returns a dataframe of results


solve_caesar <-
function(ciphertext, expected_dist) {
  # Perform a brute force search on all possible direct
  # rotations performing a chi square test on the output
  # with the expected frequency distribution.
  #
  #
  # Args:
  #     ciphertext: a string containing the ciphertext
  #     expected_dist: a table containing the frequency
  #     distribution for the target language; this is
  #     then used in chi square tests of similarity
  #
  # Returns:
  #     results: a data frame containing all the attempted decrypts,
  #     the chi square test statistics for each decrypt, the best
  #     scoring decrypt's alphabet offset (in $best), and the
  #     associated decrypt using that offset (in $suggested_decrypt)

  lowest_chi_score <- c(999999)
  results <- as.data.frame(c())
  for(brute in 1:(length(expected_dist)))
  {
    cipher_alphabet <- shift_alphabet(alphabet, brute)
    encrypt <- hash(alphabet, cipher_alphabet)
    decrypt <- invert(encrypt)
    decrypted_text <- crypt(ciphertext, decrypt)


    decrypted_counts <- charcount(decrypted_text)
    chi_results <- chisq.test(decrypted_counts, p=english)

    if(chi_results$statistic < lowest_chi_score) {
      lowest_chi_score <- chi_results$statistic
      index <- brute
      suggested_decrypt <- decrypted_text
    }
    new.entry <- data.frame(brute, chi_results$statistic, decrypted_text)
    results <- rbind(results, new.entry)
  }
  results$best <- index
  results$suggested_decrypt <- suggested_decrypt
  return(results)
}
