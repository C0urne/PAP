


library(tidyverse)
library(readxl)
library(ggplot2)
library(pdftools)
library(tm)


# Read PDF file and convert it to text
pdf_file <- file("FR_2023_PLF_BG_PGM_124.pdf")

# Input string
input <- "Prévision Exécution 2022 hors CAS Pensions 307,96
Impact des mesures de transfert et de périmètre 2022–2023 0,00
Débasage de dépenses au profil atypique : -16,62
– GIPA -0,12
– Indemnisation des jours de CET -1,26
– Mesures de restructurations -0,22
– Autres -15,02
Impactduschéma d'emplois 5,48
EAP schéma d'emplois 2022 1,93
Schéma d'emplois 2023 3,55
Mesures catégorielles 2,56
Mesures générales 3,92
Rebasage de la GIPA 0,12
Variation du point de la fonction publique 3,80
Mesures bas salaires 0,00
GVTsolde 0,28
GVT positif 3,60
GVT négatif -3,32
Rebasage de dépenses auprofilatypique –hors GIPA 6,86
Indemnisation des jours de CET 1,26
Mesures de restructurations 0,00
Autres 5,60
Autres variationsdes dépenses de personnel 4,80
Prestations sociales et allocations diverses -catégorie 23 0,00
Autres 4,80
Total 315,24"

# Split the character string into lines
lines <- strsplit(input, "\n")[[1]]

# Initialize empty vectors for text and numbers
text_content <- c()
numbers <- c()

# Extract the text and numbers from each line
for (line in lines) {
  # Split the line into text and numbers using whitespace as the delimiter
  parts <- strsplit(line, "\\s+")[[1]]
  
  # Extract the text content
  text <- paste(parts[-length(parts)], collapse = " ")
  
  # Extract the number
  number <- parts[length(parts)]
  
  # Append to the vectors
  text_content <- c(text_content, text)
  numbers <- c(numbers, number)
}

# Create a dataframe with text and numbers
df <- data.frame(Text = text_content, Number = numbers, stringsAsFactors = FALSE)



































