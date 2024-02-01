


library(tidyverse)
library(readxl)
library(ggplot2)
library(pdftools)
library(tm)

gvt <- read_xlsx("data/gvt.xlsx")



table(gvt$year)


gvt %>%
    ggplot(aes(x = year, y = gvt_solde, color = as.factor(Programme))) +
      geom_line()

















































