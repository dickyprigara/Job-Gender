library(shiny)
library(shinydashboard)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)
library(plotly)
library(glue)
workers <- read.csv("data_input/jobs_gender.csv")

workers_clean <- workers %>% 
  mutate_if(is.character, as.factor) %>% 
  drop_na(total_earnings_female, total_earnings_male) %>% 
  select(-wage_percent_of_male)

