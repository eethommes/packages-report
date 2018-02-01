## create a data frame from data/installed-packages.csv
## with, e.g., readr::read_csv() or read.csv()
df <- read.csv("/Users/ethommes/Desktop/packages-report/data/installed-packages.csv")

## filter out packages in the default library
## keep variables Package and Built
## if you use dplyr, code like this will work:
df2 <- df %>%
  filter(LibPath == .libPaths()[1]) %>%
  select(Package, Built)

## write this new, smaller data frame to data/add-on-packages.csv
write.csv(df2, "/Users/ethommes/Desktop/packages-report/data/add-on-packages.csv")

## make a frequency table of package by the version in Built
## if you use dplyr, code like this will work:
df2_freqtable <- df2 %>%
  count(Built) %>%
  mutate(prop = n / sum(n))

## write this data frame to data/add-on-packages-freqtable.csv
## YES overwrite the files that are there now
## they came from me (Jenny)
## they are just examples
write.csv(df2_freqtable, "/Users/ethommes/Desktop/packages-report/data/add-on-packages-freqtable.csv")

## when this script works, stage & commit it and the csv files
## PUSH!
