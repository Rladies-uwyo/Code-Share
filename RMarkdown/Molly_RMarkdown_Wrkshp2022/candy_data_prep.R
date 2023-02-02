# Candy data prep code for R Markdown Activity ################################
## 12 October 2022
## Molly Caldwell
###############################################################################

#set the working directory- modify to folder on your computer with the candy datasets
setwd("C:/Users/molly/OneDrive - University of Wyoming/Documents/UWyo/Workshops_seminars/RMarkdown/Merkle Lab 10.2022/")

#Read in the candy_data and candy_vote csvs
candy_data <- read.csv("./candy_data.csv")
candy_votes <- read.csv("./candy_votes.csv")

#Rename peanutalmonds to nuts in candy_data
candy_data <- candy_data %>% 
  rename(nuts = peanutalmonds)

#calculate percentage of votes per candy
candy_votes <- candy_votes %>%
  mutate(perc_votes = (num_votes/sum(num_votes))*100)

#combine candy_data and candy_votes
candy <- left_join(candy_data, candy_votes, by = "candy_name")