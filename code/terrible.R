

library(tidyverse)
library(readxl)
library(ggplot2)
library(hrbrthemes)
library(openxlsx)

# 124 2024
d_124_24 <- data.frame(
  "Principaux facteurs d'évolution" = c("Socle Exécution 2023 retraitée", "Prévision Exécution 2023 hors CAS Pensions", "Impact des mesures de transfert et de périmètre 2023–2024", "Débasage de dépenses au profil atypique", "– GIPA", "– Indemnisation des jours de CET", "– Mesures de restructurations", "– Autres", "Impact du schéma d'emplois", "EAP schéma d'emplois 2023", "Schéma d'emplois 2024", "Mesures catégorielles", "Mesures générales", "Rebasage de la GIPA", "Variation du point de la fonction publique", "Mesures bas salaires", "GVT solde", "GVT positif", "GVT négatif", "Rebasage de dépenses au profil atypique – hors GIPA", "Indemnisation des jours de CET", "Mesures de restructurations", "Autres", "Autres variations des dépenses de personnel", "Prestations sociales et allocations diverses - catégorie 23", "Autres_2","Total"),
  "Valeur" = c(322.00, 329.33, -0.44, -6.89, -0.28, -1.39, 0.00, -5.22, 5.00, 1.74, 3.26, 4.76, 3.93, 2.21, 1.68, 0.04, 2.59, 4.29, -1.70, 4.67, 1.52, 0.00, 3.16, 0.48, 0.48, 0.00, 343.42)
)

#155 2024
d_155_24 <- data.frame(
  "Principaux facteurs d'évolution" = c("Socle Exécution 2023 retraitée", "Prévision Exécution 2023 hors CAS Pensions", "Impact des mesures de transfert et de périmètre 2023–2024", "Débasage de dépenses au profil atypique", "– GIPA", "– Indemnisation des jours de CET", "– Mesures de restructurations", "– Autres", "Impact du schéma d'emplois", "EAP schéma d'emplois 2023", "Schéma d'emplois 2024", "Mesures catégorielles", "Mesures générales", "Rebasage de la GIPA", "Variation du point de la fonction publique", "Mesures bas salaires", "GVT solde", "GVT positif", "GVT négatif", "Rebasage de dépenses au profil atypique – hors GIPA", "Indemnisation des jours de CET", "Mesures de restructurations", "Autres", "Autres variations des dépenses de personnel", "Prestations sociales et allocations diverses - catégorie 23", "Autres_2","Total"),
  "Valeur" = c(414.47, 422.08, 0.00, -7.61, -0.52, -2.34, 0.00, -4.75, 2.97, 2.65, 0.32, 7.32, 5.06, 2.72, 2.28, 0.06, 2.91, 5.92, -3.00, 4.85, 2.55, 0.00, 2.30, 0.54, 0.54, 0.00, 438.12)
)

d_124_23 <- data.frame(
  "Principaux facteurs d'évolution" = c("Socle Exécution 2022 retraitée", "Prévision Exécution 2022 hors CAS Pensions", "Impact des mesures de transfert et de périmètre 2022–2023", "Débasage de dépenses au profil atypique", "– GIPA", "– Indemnisation des jours de CET", "– Mesures de restructurations", "– Autres", "Impact du schéma d'emplois", "EAP schéma d'emplois 2022", "Schéma d'emplois 2023", "Mesures catégorielles", "Mesures générales", "Rebasage de la GIPA", "Variation du point de la fonction publique", "Mesures bas salaires", "GVT solde", "GVT positif", "GVT négatif", "Rebasage de dépenses au profil atypique – hors GIPA", "Indemnisation des jours de CET", "Mesures de restructurations", "Autres", "Autres variations des dépenses de personnel", "Prestations sociales et allocations diverses - catégorie 23", "Autres_2","Total"),
  "Valeur" = c(389.09, 411.60, -4.00, -18.51, -0.13, -2.51, -0.46, -15.42, 2.31, -1.23, 3.54, 2.58, 5.43, 0.13, 5.30, 0.00, 0.05, 6.05, -6.00, 14.73, 2.45, 0.00, 12.28, 2.72, 0.00, 2.72, 416.91)
)


d_155_23 <- data.frame(
  "Principaux facteurs d'évolution" = c("Socle Exécution 2022 retraitée", "Prévision Exécution 2022 hors CAS Pensions", "Impact des mesures de transfert et de périmètre 2022–2023", "Débasage de dépenses au profil atypique", "– GIPA", "– Indemnisation des jours de CET", "– Mesures de restructurations", "– Autres", "Impact du schéma d'emplois", "EAP schéma d'emplois 2022", "Schéma d'emplois 2023", "Mesures catégorielles", "Mesures générales", "Rebasage de la GIPA", "Variation du point de la fonction publique", "Mesures bas salaires", "GVT solde", "GVT positif", "GVT négatif", "Rebasage de dépenses au profil atypique – hors GIPA", "Indemnisation des jours de CET", "Mesures de restructurations", "Autres", "Autres variations des dépenses de personnel", "Prestations sociales et allocations diverses - catégorie 23", "Autres_2","Total"),
  "Valeur" = c(291.34, 307.96, 0.00, -16.62, -0.12, -1.26, -0.22, -15.02, 5.48, 1.93, 3.55, 2.56, 3.92, 0.12, 3.80, 0.00, 0.28, 3.60, -3.32, 6.86, 1.26, 0.00, 5.60, 4.80, 0.00, 4.80, 315.24)
)

d_124_22 <- data.frame(
  "Principaux facteurs d'évolution" = c("Socle Exécution 2021 retraitée", "Prévision Exécution 2021 hors CAS Pensions", "Impact des mesures de transfert et de périmètre 2021–2022", "Débasage de dépenses au profil atypique", "– GIPA", "– Indemnisation des jours de CET", "– Mesures de restructurations", "– Autres", "Impact du schéma d'emplois", "EAP schéma d'emplois 2021", "Schéma d'emplois 2022", "Mesures catégorielles", "Mesures générales", "Rebasage de la GIPA", "Variation du point de la fonction publique", "Mesures bas salaires", "GVT solde", "GVT positif", "GVT négatif", "Rebasage de dépenses au profil atypique – hors GIPA", "Indemnisation des jours de CET", "Mesures de restructurations", "Autres", "Autres variations des dépenses de personnel", "Prestations sociales et allocations diverses - catégorie 23", "Autres_2","Total"),
  "Valeur" = c(275.52, 301.15, -1.63, -24.00, -0.03, -1.10, -2.06, -20.81, 3.49, 1.27, 2.22, 1.10, 0.50, 0.50, 0.00, 0.00, 0.23, 3.96, -3.74, 3.75, 1.10, 1.06, 1.58, 5.77, 0.98, 4.79, 290.36)
)

d_155_22 <- data.frame(
  "Principaux facteurs d'évolution" = c("Socle Exécution 2021 retraitée", "Prévision Exécution 2021 hors CAS Pensions", "Impact des mesures de transfert et de périmètre 2021–2022", "Débasage de dépenses au profil atypique", "– GIPA", "– Indemnisation des jours de CET", "– Mesures de restructurations", "– Autres", "Impact du schéma d'emplois", "EAP schéma d'emplois 2021", "Schéma d'emplois 2022", "Mesures catégorielles", "Mesures générales", "Rebasage de la GIPA", "Variation du point de la fonction publique", "Mesures bas salaires", "GVT solde", "GVT positif", "GVT négatif", "Rebasage de dépenses au profil atypique – hors GIPA", "Indemnisation des jours de CET", "Mesures de restructurations", "Autres", "Autres variations des dépenses de personnel", "Prestations sociales et allocations diverses - catégorie 23", "Autres_2","Total"),
  "Valeur" = c(384.15, 415.17, -1.25, -29.77, -0.07, -2.11, -5.38, -22.21, -0.34, -4.16, 3.83, 1.73, 0.64, 0.64, 0.00, 0.00, 2.65, 5.15, -2.50, 12.64, 2.11, 2.89, 7.64, 7.61, 1.40, 6.21, 409.07)
)

d_124_21 <- data.frame(
  "Principaux facteurs d'évolution" = c("Socle Exécution 2020 retraitée", "Prévision Exécution 2020 hors CAS Pensions", "Impact des mesures de transfert et de périmètre 2020–2021", "Débasage de dépenses au profil atypique", "– GIPA", "– Indemnisation des jours de CET", "– Mesures de restructurations", "– Autres", "Impact du schéma d'emplois", "EAP schéma d'emplois 2020", "Schéma d'emplois 2021", "Mesures catégorielles", "Mesures générales", "Rebasage de la GIPA", "Variation du point de la fonction publique", "Mesures bas salaires", "GVT solde", "GVT positif", "GVT négatif", "Rebasage de dépenses au profil atypique – hors GIPA", "Indemnisation des jours de CET", "Mesures de restructurations", "Autres", "Autres variations des dépenses de personnel", "Prestations sociales et allocations diverses - catégorie 23", "Autres_2","Total"),
  "Valeur" = c(281.87, 430.54, -129.05, -19.62, 0.00, -3.82, -0.23, -15.57, -4.06, -6.08, 2.02, 0.17, 0.31, 0.31, 0.00, 0.00, 2.66, 6.80, -4.14, 4.80, 3.80, 0.00, 1.00, 0.00, 0.00, 0.00, 285.75)
)

d_155_21 <- data.frame(
  "Principaux facteurs d'évolution" = c("Socle Exécution 2020 retraitée", "Prevision Execution 2020 hors CAS Pensions", "Impact des mesures de transfert et de perimetre 2020–2021", "Debasage de depenses au profil atypique", "– GIPA", "– Indemnisation des jours de CET", "– Mesures de restructurations", "– Autres", "Impact du schéma d'emplois", "EAP schema d'emplois 2020", "Schema d'emplois 2021", "Mesures catégorielles", "Mesures générales", "Rebasage de la GIPA", "Variation du point de la fonction publique", "Mesures bas salaires", "GVT solde", "GVT positif", "GVT negatif", "Rebasage de dépenses au profil atypique – hors GIPA", "Indemnisation des jours de CET", "Mesures de restructurations", "Autres", "Autres variations des dépenses de personnel", "Prestations sociales et allocations diverses - categorie 23", "Autres_2","Total"),
  "Valeur" = c(394.86, 430.10, -27.49, -7.75, -0.06, -2.00, -0.18, -5.52, -7.43, -2.47, -4.96, 0.37, 0.21, 0.21, 0.00, 0.00, 3.34, 6.16, -2.82, 3.00, 2.00, 0.00, 1.00, 0.06, 0.06, 0.00, 394.40)
)

ds_l <- list(d_124_24, d_155_24, d_124_23, d_155_23, d_124_22, d_155_22, d_124_21, d_155_21)


d_124_21[2]

tab <- data.frame(
  "var" = d_124_21[1],
  "andy" = d_124_21[2],
  "aie" = d_124_22[2],
  "andy" = d_124_23[2],
  "andy" = d_124_24[2],
  "andy" = d_155_21[2],
  "andy" = d_155_22[2],
  "andy" = d_155_23[2],
  "andy" = d_155_24[2]
)

names(tab) <- c("Principaux_facteurs_d'évolution", "d_124_21", "d_124_22", "d_124_23","d_124_24","d_155_21","d_155_22","d_155_23","d_155_24")

ttab <- t(tab[, -1])
ttab <- as.data.frame(ttab)
colnames(ttab) <- tab$`Principaux_facteurs_d'évolution`

names(ttab)[names(ttab) == "GVT positif"] <- "GVT_positif"

ttab %>%
  ggplot(aes(x = "GVT positif", group =e)) +
    geom_bar()


ggplot(ttab, aes(y = `GVT solde`, x = rownames(ttab), fill = substr(rownames(ttab), 3, 5))) +
  geom_bar(stat = "identity") +
  labs(x = "programme_année", y = "GVT solde", title = "", fill ="") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 20, hjust = 1)) +
  scale_fill_manual(values = c("#d57254", "#54bcd5"))

ggplot(ttab, aes(y = Total, x = rownames(ttab), fill = substr(rownames(ttab), 3, 5))) +
  geom_bar(stat = "identity") +
  labs(x = "programme_année", y = "Total", title = "", fill ="") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 20, hjust = 1)) +
  scale_fill_manual(values = c("#d57254", "#54bcd5"))

ggplot(ttab, aes(y = `Impact du schéma d'emplois`, x = rownames(ttab), fill = substr(rownames(ttab), 3, 5))) +
  geom_bar(stat = "identity") +
  labs(x = "programme_année", y = "Impact du schéma d'emplois", title = "", fill ="") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 20, hjust = 1)) +
  scale_fill_manual(values = c("#d57254", "#54bcd5"))

ggplot(ttab, aes(y = `Socle Exécution 2020 retraitée`, x = rownames(ttab), fill = substr(rownames(ttab), 3, 5))) +
  geom_bar(stat = "identity") +
  labs(x = "programme_année", y = "Socle Exécution 2020 retraitée", title = "", fill ="") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 20, hjust = 1)) +
  scale_fill_manual(values = c("#d57254", "#54bcd5"))


## effectifs gérés

# effectifs <- data.frame(
#   "année" = c(2020, 2021, 2022, 2023, 2024, 2025, 2026),
#   "p124_p155" = c(17283, 12366, 12453, 12210, 12382, 12382, 12382)
# )
effectifs <- data.frame(
  "année" = c(2021, 2022, 2023, 2024, 2025, 2026),
  "p124_p155" = c(12366, 12453, 12210, 12382, 12382, 12382)
)

ggplot(effectifs, aes(y = p124_p155, x = année)) +
  geom_line() +
  geom_point() +
  ggtitle("Effectifs p124 et p155 de 2021 à 2026")


ggplot(effectifs, aes(y = p124_p155, x = année)) +
  geom_line() +
  geom_point(shape=21, color="black", fill="#69b3a2", size=3) +
  geom_text(aes(label = p124_p155), check_overlap = TRUE, nudge_y = 10) +
  ggtitle("Effectifs p124 et p155 de 2021 à 2026")

## Masse salariale

ms <- data.frame(
  "année" = c(2021, 2022, 2023, 2024),
  "programme" = c("p124", "p155"),
  "Total masse salariale" = c(343.42, 438.12, 12210, 12382, 12382, 12382)
)

ms <- data_frame(
  "année" = c(2021, 2022, 2023, 2024, 2021, 2022, 2023, 2024),
  "programme" = c("p124", "p124","p124","p124", "p155", "p155", "p155", "p155"),
  "Total_masse_salariale" = c(285.75, 290.36, 416.91, 343.42, 394.40, 409.07, 315.24, 438.12),
  "Combinés" = c(680.15, 680.15, 699.43, 699.43, 732.15, 732.15, 781.54, 781.54)
)

ms <- data_frame(
  "année" = c(2021, 2022, 2023, 2024, 2021, 2022, 2023, 2024, 2021, 2022, 2023, 2024),
  "programme" = c("p124", "p124","p124","p124", "p155", "p155", "p155", "p155", "Combinés", "Combinés", "Combinés", "Combinés"),
  "Total_masse_salariale" = c(285.75, 290.36, 416.91, 343.42, 394.40, 409.07, 315.24, 438.12,   680.15, 699.43, 732.15, 781.54),
)

ggplot(ms, aes(y = Total_masse_salariale, x = année, color = as.factor(programme))) +
  geom_line(linewidth = 1) +
  geom_point(shape=21, fill = "grey", color="black", size=3) +
  geom_text(aes(label = Total_masse_salariale), check_overlap = TRUE, nudge_y = 20, color = "black") +
  ggtitle("Evolution de la masse salariale de 2021 à 2024") +
  scale_color_manual(values = c("#2eaf4c", "#d57254", "#54bcd5")) +
  labs(color = "")










effectifs <- data.frame(
  "année" = c(2021, 2022, 2023, 2024, 2025, 2026),
  "p124_p155" = c(12366, 12453, 12210, 12382, 12382, 12382)
)

poos <- data_frame(
  "année" = c(2021, 2022, 2023, 2024),
  "programme" = c("Combinés", "Combinés", "Combinés", "Combinés"),
  "Total_masse_salariale" = c(680.15, 699.43, 732.15, 781.54),
)

e_ms <- merge(effectifs, poos, by = "année", all = TRUE)


ggplot(e_ms, aes(x = Total_masse_salariale, y = p124_p155)) +
  geom_line(linewidth = 0.7) +
  geom_point(shape=21, fill = "grey", color="black", size=3) +
  geom_text(aes(label = Total_masse_salariale), check_overlap = TRUE, nudge_y = 20, color = "black") +
  ggtitle("Effectifs et masse salariale") +
  scale_color_manual(values = c("#2eaf4c", "#d57254", "#54bcd5")) +
  labs(color = "")














































































  





