# Based on https://stackoverflow.com/questions/52804450/comparison-of-two-groups-using-word-cloud-comparison-r

# install.packages("quanteda")
# install.packages("quanteda.textplots")
# install.packages("readtext") 

require(quanteda)
require(quanteda.textplots)
require(readtext)

setwd("/Users/timsteinkuhler/repos/xke-apres-ski")
# import csv file
data_apres_ski_lyrics <- read.csv("data/all_songs_with_lyrics_cleaned.csv")
names(data_apres_ski_lyrics)
# data_with_lyrics = data_apres_ski_lyrics[data_apres_ski_lyrics$has_lyrics,]
data_with_lyrics <- data_apres_ski_lyrics[data_apres_ski_lyrics$has_lyrics=="True",]
data_with_lyrics = data_with_lyrics[,!(names(data_with_lyrics) %in% c("lyrics","z"))]


data_german = data_with_lyrics[data_with_lyrics$language=="German",]
corp_lyrics <- corpus(data_german, text_field = "clean_lyrics")
print(corp_lyrics)
summary(corp_lyrics, 6)

# tokenize texts
toks <- tokens(corp_lyrics, remove_punct = TRUE)

# create a grouped dfm and compare groups
dfmat_corp_language <- dfm(toks) %>%
  dfm_remove(stopwords("de")) %>% 
  dfm_group(groups = playlist)

# create wordcloud
set.seed(42) # set seed for reproducibility
textplot_wordcloud(
  dfmat_corp_language,
  comparison = TRUE,
  max_words = 100,
  color = c("blue", "orange"),
  min_size=0.5,
  max_size=2
)


data_dutch = data_with_lyrics[data_with_lyrics$language=="Dutch, Flemish",]

corp_lyrics <- corpus(data_dutch, text_field = "clean_lyrics")
print(corp_lyrics)
summary(corp_lyrics, 6)

# tokenize texts
toks <- tokens(corp_lyrics, remove_punct = TRUE)

# create a grouped dfm and compare groups
dfmat_corp_language <- dfm(toks) %>%
  dfm_remove(stopwords("nl")) %>% 
  dfm_group(groups = playlist)

# create wordcloud
set.seed(132) # set seed for reproducibility
textplot_wordcloud(
  dfmat_corp_language,
  comparison = TRUE,
  max_words = 100,
  color = c("blue", "orange"),
  min_size=0.5,
  max_size=2)




data_english = data_with_lyrics[data_with_lyrics$language=="English",]

corp_lyrics <- corpus(data_english, text_field = "clean_lyrics")
print(corp_lyrics)
summary(corp_lyrics, 6)

# tokenize texts
toks <- tokens(corp_lyrics, remove_punct = TRUE)

# create a grouped dfm and compare groups
dfmat_corp_language <- dfm(toks) %>%
  dfm_remove(stopwords("en")) %>% 
  dfm_group(groups = playlist)

# create wordcloud
set.seed(132) # set seed for reproducibility
textplot_wordcloud(
  dfmat_corp_language,
  comparison = TRUE,
  max_words = 100,
  color = c("blue", "orange"),
  min_size=0.5,
  max_size=2)


data_german_apres = subset(data_with_lyrics, (language=="German" & playlist=="Après Ski"))
corp_lyrics <- corpus(data_german_apres, text_field = "clean_lyrics")
toks <- tokens(corp_lyrics, remove_punct = TRUE)

# create a grouped dfm and compare groups
dfmat_corp_language <- dfm(toks) %>%
  dfm_remove(stopwords("de"))

set.seed(42) # set seed for reproducibility
textplot_wordcloud(dfmat_corp_language, max_words = 50)
