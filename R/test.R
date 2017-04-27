library(hash)
library(ggplot2)

# Create our base alphabet for valid characters
alphabet <- toupper(letters)

# Create our cipher alphabet for encrypting and decrypting
# supplied texts. In this case it will be an alphabet
# shifted by 5 characters which is then stored as a hash table
# for encrypting with 'encrypt' and the inverse of that hash
# table 'decrypt'
cipher_alphabet <- shift_alphabet(alphabet, 5)
encrypt <- hash(alphabet, cipher_alphabet)
decrypt <- invert(encrypt)

# create a table with the monograph frequency table
# based on English language word usage; below frequencies
# are based on a sample of 1000 letters and then converted
# to sum to 1 by dividing each value by 1000
english <- as.table(c(74,10,31,42,130,28,16,34,74,2,3,36,25,79,75,27,3,76,61,92,26,15,16,5,19,1))
english <- english / 1000

# Use the stored data sample text of 'npr_news' consisting of
# over 3000 characters of text and use the crypt() function
# to encrypt the text using the 'encrypt' alphabet generated
# above. The current implemenetation requires all 26 alpha
# characters to be present in the ciphertext, all converted to
# uppercase, and all non-alpha characters removed

npr_news <- c('InarareshowofforcethousandsofRussianstooktothestreetsofMoscowandothercitiesinthebiggestantigovernmentprotestsinyearsInMoscowpolicearrestedhundredsofdemonstratorsincludingprominentRussianoppositionleaderandanticorruptionactivistAlexeiNavalnywhoorchestratedtheuprisingInARareProtestRussianTruckersRallyAgainstPutinsHighwayTaxThecrowdsgatheredtoprotestgovernmentcorruptionmanycallingforPrimeMinisterDmitryMedvedevsresignationNavalnyhadcalledfornationwideprotestsafterpublishinganinvestigationearlierthismonthallegingmasscorruptionchargesagainstMedvedevwhoselargefortunefarexceededhispositionssalaryAtleastfivehundreddemonstratorswerearrestedinMoscowreporterCharlesMaynestellsNPRamongthetensofthousandswhoturnedoutnationwidedespitewarningsfromauthoritiesthatprotesterswouldfacefinesandarrestfortakingpartintheillegalprotestTherewerereportsoftwothousandpeopleshowingupinNovaSiberskinSiberiawehadtenthousdandinStPetersburgtheestimateshereinMoscowareabouttwentythousandhesaysButNavalnysawlittleoftheprotestheorganizedMaynessaysRiotpolicedetainedtheoppositionleaderassoonashearrivedindowntownMoscowwithNavalnysupportersbrieflyattemptingtopryopenthepolicevanthatheldhiminthecapitalsiconicPushkinSquareAtotalofseventeenemployeeswithNavalnysAntiCorruptionFoundationwerealsoarrestedthefoundationsdirectorandpresssecretaryRomanRubanovtellsReutersTheAPcitessporadicscufflesmostnotablyagrayhairedmanwhompolicedraggedalongthepavementRussianstatemediameanwhilemostlyignoredthedayseventssaveforearliercursorycoverageandnocommentshavebeenreportedfromtopRussianpoliticiansFollowingcriticismoftheTrumpadministrationssilenceonSundayscrackdowntheStateDepartmentcondemnedthearrestsbyeveningcallingthemoveanaffronttocoredemocraticvaluesSpokesmanMarkTonersaidtheUnitedStateswillmonitorthissituationandwecallonthegovernmentofRussiatoimmediatelyreleaseallpeacefulprotestersaddingthatWashingtonwastroubledtohearofthearrestofRussianoppositionfigureAlexeiNavalnySundayamountstothebiggestshowofdefiancesincethetwentytenandtwentytwelvewaveofdemonstrationsthatrattledtheKremlinandledtoharshnewlawsaimedatsuppressingdissentsaystheAPAtthetimePresidentVladimirPutinaccusedthenSecretaryofStateHillaryClintonofincitingtheprotestsNavalnyisalsocreditedwithinstigatingthosedemonstrationswhenhefirstroseasanantiKremlinthreatthroughhisblogandsocialmediaAsNPRsLucianKimreportedhecalledonRussianstogooutonthestreetandprotestvoterfraudintheparliamentaryelectionsAfiercePutincriticNavalnyplanstorunforpresidentnextyearwhenPutinstermendsPutinisexpectedtorunforafourthtermButlastmonthNavalnywasfoundguiltyofembezzlementinacaseheclaimsispoliticallychargedtodisqualifyhimfromrunningforpresidentThoughthecandidateisessentiallybarredfromstatemediacoverageasreporterCharlesMaynessayshisheavyinternetpresenceappearstobehelpinghimusehisanticorruptionmessagetoexpandhisbaseandattractyoungercrowdsNavalnyhasunitedpeoplewhothinkthesamethatpeopledontagreewiththeauthoritiesisobviousfromwhatisgoingoninthecountrytodayonenineyearoldAnnaIvanovatoldtheAPattheMoscowdemonstrationIamabitscaredj')
npr_news <- toupper(npr_news)
npr_news_encrypted <- crypt(npr_news, encrypt)

# Use the solve_caesar() function to search for possible
# decrypts of this text based on the chi square test results
# comparing the attempted decrypts with the expected letter
# distributions for English which is stored in the 'english'
# data vector

results <- solve_caesar(npr_news_encrypted, english)

# Which alphabet rotation had the best chi square test result?
results$best[1]

# What is the expected plaintext based on that solution?
results$suggested_decrypt[1]

# Display the Chi Square statistics for the different attempted
# decrypts

graph <- ggplot(results) + geom_point(aes(x = results$brute, y=results$chi_results.statistic,
    color = results$chi_results.statistic < 1000 )) +
    labs(title="Chi Square Test Results", x = "Cipher Shift", y="ChiSqu Score") +
    theme(legend.position = "none") +
    scale_x_discrete(limit = results$brute, breaks = results$brute) +
    scale_color_manual(values = setNames(c('green','red'), c(T,F)))
graph
