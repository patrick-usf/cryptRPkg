# cryptRPkg
Basic cryptanalysis tool in R

This project performs basic cryptanalysis statistics on a simple direct substitution cipher in order to find the correct setting necessary to decrypt the text.

To accomplish this goal the R code performs a count of the number of times each alphabetic character is present in the input and then compares the overall frequencies to a provided frequency from the user using the chi square test. The chi square statistic will be lowest when the frequency of the input matches the expected frequency. For the problem of a direct substitution cipher the R code can therefore try each of the 26 possible alphabet settings, calculate the chi square statistic for each attempted decrypt, and compare those scores to the frequency distribution the user provides. In the stored data associated with this package is the vector 'english' containing the frequency distribution for the English language.

The test.R file also walks the user through creating a cipher alphabet, generating the corresponding deciphering alphabet, using the cipher alphabet to encrypt a body of approximately 3000 characters from an English language news story using the Casear Cipher technique, and then using the solve_caesar() function to find the correct settings to decrypt the text.

The solve_caesar() function also returns what it believes to be the correct decrypted text and a graph can be plotted of the chi square scores to visualize the full range of scores in the event that there are other good candidate settings with similar low chi square scores.
