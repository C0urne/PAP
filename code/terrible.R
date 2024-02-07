library(tidyverse)
library(readxl)
library(ggplot2)
library(hrbrthemes)
library(gridExtra)
library(ggrepel)
library(openxlsx)

# 124 2024
d_124_24 <- data.frame(
  "Principaux facteurs d'évolution" = c("Socle Exécution 2023 retraitée", "Prévision Exécution 2023 hors CAS Pensions", "Impact des mesures de transfert et de périmètre 2023–2024", "Débasage de dépenses au profil atypique", "– GIPA", "– Indemnisation des jours de CET", "– Mesures de restructurations", "– Autres", "Impact du schéma d'emplois", "EAP schéma d'emplois 2023", "Schéma d'emplois 2024", "Mesures catégorielles", "Mesures générales", "Rebasage de la GIPA", "Variation du point de la fonction publique", "Mesures bas salaires", "GVT solde", "GVT positif", "GVT négatif", "Rebasage de dépenses au profil atypique – hors GIPA", "Indemnisation des jours de CET", "Mesures de restructurations", "Autres", "Autres variations des dépenses de personnel", "Prestations sociales et allocations diverses - catégorie 23", "Autres_2", "Total"),
  "Valeur" = c(322.00, 329.33, -0.44, -6.89, -0.28, -1.39, 0.00, -5.22, 5.00, 1.74, 3.26, 4.76, 3.93, 2.21, 1.68, 0.04, 2.59, 4.29, -1.70, 4.67, 1.52, 0.00, 3.16, 0.48, 0.48, 0.00, 343.42)
)

# 155 2024
d_155_24 <- data.frame(
  "Principaux facteurs d'évolution" = c("Socle Exécution 2023 retraitée", "Prévision Exécution 2023 hors CAS Pensions", "Impact des mesures de transfert et de périmètre 2023–2024", "Débasage de dépenses au profil atypique", "– GIPA", "– Indemnisation des jours de CET", "– Mesures de restructurations", "– Autres", "Impact du schéma d'emplois", "EAP schéma d'emplois 2023", "Schéma d'emplois 2024", "Mesures catégorielles", "Mesures générales", "Rebasage de la GIPA", "Variation du point de la fonction publique", "Mesures bas salaires", "GVT solde", "GVT positif", "GVT négatif", "Rebasage de dépenses au profil atypique – hors GIPA", "Indemnisation des jours de CET", "Mesures de restructurations", "Autres", "Autres variations des dépenses de personnel", "Prestations sociales et allocations diverses - catégorie 23", "Autres_2", "Total"),
  "Valeur" = c(414.47, 422.08, 0.00, -7.61, -0.52, -2.34, 0.00, -4.75, 2.97, 2.65, 0.32, 7.32, 5.06, 2.72, 2.28, 0.06, 2.91, 5.92, -3.00, 4.85, 2.55, 0.00, 2.30, 0.54, 0.54, 0.00, 438.12)
)

d_155_23 <- data.frame(
  "Principaux facteurs d'évolution" = c("Socle Exécution 2022 retraitée", "Prévision Exécution 2022 hors CAS Pensions", "Impact des mesures de transfert et de périmètre 2022–2023", "Débasage de dépenses au profil atypique", "– GIPA", "– Indemnisation des jours de CET", "– Mesures de restructurations", "– Autres", "Impact du schéma d'emplois", "EAP schéma d'emplois 2022", "Schéma d'emplois 2023", "Mesures catégorielles", "Mesures générales", "Rebasage de la GIPA", "Variation du point de la fonction publique", "Mesures bas salaires", "GVT solde", "GVT positif", "GVT négatif", "Rebasage de dépenses au profil atypique – hors GIPA", "Indemnisation des jours de CET", "Mesures de restructurations", "Autres", "Autres variations des dépenses de personnel", "Prestations sociales et allocations diverses - catégorie 23", "Autres_2", "Total"),
  "Valeur" = c(389.09, 411.60, -4.00, -18.51, -0.13, -2.51, -0.46, -15.42, 2.31, -1.23, 3.54, 2.58, 5.43, 0.13, 5.30, 0.00, 0.05, 6.05, -6.00, 14.73, 2.45, 0.00, 12.28, 2.72, 0.00, 2.72, 416.91)
)

d_124_23 <- data.frame(
  "Principaux facteurs d'évolution" = c("Socle Exécution 2022 retraitée", "Prévision Exécution 2022 hors CAS Pensions", "Impact des mesures de transfert et de périmètre 2022–2023", "Débasage de dépenses au profil atypique", "– GIPA", "– Indemnisation des jours de CET", "– Mesures de restructurations", "– Autres", "Impact du schéma d'emplois", "EAP schéma d'emplois 2022", "Schéma d'emplois 2023", "Mesures catégorielles", "Mesures générales", "Rebasage de la GIPA", "Variation du point de la fonction publique", "Mesures bas salaires", "GVT solde", "GVT positif", "GVT négatif", "Rebasage de dépenses au profil atypique – hors GIPA", "Indemnisation des jours de CET", "Mesures de restructurations", "Autres", "Autres variations des dépenses de personnel", "Prestations sociales et allocations diverses - catégorie 23", "Autres_2", "Total"),
  "Valeur" = c(291.34, 307.96, 0.00, -16.62, -0.12, -1.26, -0.22, -15.02, 5.48, 1.93, 3.55, 2.56, 3.92, 0.12, 3.80, 0.00, 0.28, 3.60, -3.32, 6.86, 1.26, 0.00, 5.60, 4.80, 0.00, 4.80, 315.24)
)

d_124_22 <- data.frame(
  "Principaux facteurs d'évolution" = c("Socle Exécution 2021 retraitée", "Prévision Exécution 2021 hors CAS Pensions", "Impact des mesures de transfert et de périmètre 2021–2022", "Débasage de dépenses au profil atypique", "– GIPA", "– Indemnisation des jours de CET", "– Mesures de restructurations", "– Autres", "Impact du schéma d'emplois", "EAP schéma d'emplois 2021", "Schéma d'emplois 2022", "Mesures catégorielles", "Mesures générales", "Rebasage de la GIPA", "Variation du point de la fonction publique", "Mesures bas salaires", "GVT solde", "GVT positif", "GVT négatif", "Rebasage de dépenses au profil atypique – hors GIPA", "Indemnisation des jours de CET", "Mesures de restructurations", "Autres", "Autres variations des dépenses de personnel", "Prestations sociales et allocations diverses - catégorie 23", "Autres_2", "Total"),
  "Valeur" = c(275.52, 301.15, -1.63, -24.00, -0.03, -1.10, -2.06, -20.81, 3.49, 1.27, 2.22, 1.10, 0.50, 0.50, 0.00, 0.00, 0.23, 3.96, -3.74, 3.75, 1.10, 1.06, 1.58, 5.77, 0.98, 4.79, 290.36)
)

d_155_22 <- data.frame(
  "Principaux facteurs d'évolution" = c("Socle Exécution 2021 retraitée", "Prévision Exécution 2021 hors CAS Pensions", "Impact des mesures de transfert et de périmètre 2021–2022", "Débasage de dépenses au profil atypique", "– GIPA", "– Indemnisation des jours de CET", "– Mesures de restructurations", "– Autres", "Impact du schéma d'emplois", "EAP schéma d'emplois 2021", "Schéma d'emplois 2022", "Mesures catégorielles", "Mesures générales", "Rebasage de la GIPA", "Variation du point de la fonction publique", "Mesures bas salaires", "GVT solde", "GVT positif", "GVT négatif", "Rebasage de dépenses au profil atypique – hors GIPA", "Indemnisation des jours de CET", "Mesures de restructurations", "Autres", "Autres variations des dépenses de personnel", "Prestations sociales et allocations diverses - catégorie 23", "Autres_2", "Total"),
  "Valeur" = c(384.15, 415.17, -1.25, -29.77, -0.07, -2.11, -5.38, -22.21, -0.34, -4.16, 3.83, 1.73, 0.64, 0.64, 0.00, 0.00, 2.65, 5.15, -2.50, 12.64, 2.11, 2.89, 7.64, 7.61, 1.40, 6.21, 409.07)
)

d_124_21 <- data.frame(
  "Principaux facteurs d'évolution" = c("Socle Exécution 2020 retraitée", "Prévision Exécution 2020 hors CAS Pensions", "Impact des mesures de transfert et de périmètre 2020–2021", "Débasage de dépenses au profil atypique", "– GIPA", "– Indemnisation des jours de CET", "– Mesures de restructurations", "– Autres", "Impact du schéma d'emplois", "EAP schéma d'emplois 2020", "Schéma d'emplois 2021", "Mesures catégorielles", "Mesures générales", "Rebasage de la GIPA", "Variation du point de la fonction publique", "Mesures bas salaires", "GVT solde", "GVT positif", "GVT négatif", "Rebasage de dépenses au profil atypique – hors GIPA", "Indemnisation des jours de CET", "Mesures de restructurations", "Autres", "Autres variations des dépenses de personnel", "Prestations sociales et allocations diverses - catégorie 23", "Autres_2", "Total"),
  "Valeur" = c(281.87, 430.54, -129.05, -19.62, 0.00, -3.82, -0.23, -15.57, -4.06, -6.08, 2.02, 0.17, 0.31, 0.31, 0.00, 0.00, 2.66, 6.80, -4.14, 4.80, 3.80, 0.00, 1.00, 0.00, 0.00, 0.00, 285.75)
)

d_155_21 <- data.frame(
  "Principaux facteurs d'évolution" = c("Socle Exécution 2020 retraitée", "Prevision Execution 2020 hors CAS Pensions", "Impact des mesures de transfert et de perimetre 2020–2021", "Debasage de depenses au profil atypique", "– GIPA", "– Indemnisation des jours de CET", "– Mesures de restructurations", "– Autres", "Impact du schéma d'emplois", "EAP schema d'emplois 2020", "Schema d'emplois 2021", "Mesures catégorielles", "Mesures générales", "Rebasage de la GIPA", "Variation du point de la fonction publique", "Mesures bas salaires", "GVT solde", "GVT positif", "GVT negatif", "Rebasage de dépenses au profil atypique – hors GIPA", "Indemnisation des jours de CET", "Mesures de restructurations", "Autres", "Autres variations des dépenses de personnel", "Prestations sociales et allocations diverses - categorie 23", "Autres_2", "Total"),
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

names(tab) <- c("Principaux_facteurs_d'évolution", "d_124_21", "d_124_22", "d_124_23", "d_124_24", "d_155_21 ", "d_155_2 2", "d_155_ 23", "d_155_24")
write.xlsx(tab, "data/processed/tab.xlsx")

ttab <- t(tab[, -1])
ttab <- as.data.frame(ttab)
colnames(ttab) <- tab$`Principaux_facteurs_d'évolution`

names(ttab)[names(ttab) == "GVT positif"] <- "GVT_positif"
ttab$année <- c(2021, 2022, 2023, 2024, 2021, 2022, 2023, 2024)
ttab$programme <- c("p124", "p124", "p124", "p124", "p155", "p155", "p155", "p155")

gvt <- data_frame(
  "année" = c(2021, 2022, 2023, 2024, 2021, 2022, 2023, 2024),
  "programme" = c("p124", "p124", "p124", "p124", "p155", "p155", "p155", "p155"),
  "gvt_solde" = c(2.66, 0.23, 0.28, 2.59, 3.34, 2.65, 0.05, 2.91)
  
)
ggplot(gvt, aes(y = gvt_solde, x = année, color = as.factor(programme))) +
  geom_line(linewidth = 1) +
  geom_point(shape = 21, color = "black", fill = "grey", size = 3) +
  geom_text(aes(label = gvt_solde), check_overlap = TRUE, nudge_x = 0.25, color = "black") +
  ggtitle("GVT, p124 et p155 de 2021 à 2024") +
  scale_color_manual(values = c("#d57254", "#54bcd5")) +
  labs(color = "", y ="GVT solde (millions d'€)",
       caption = "Source : Projet annuel de performances, années 2021 à 2024, programmes 124 et 155")
## ##

tregvt <- ttab %>% 
  select(c(17,18,19,28,29)) %>%
  melt(id.vars  =c("programme", "année"), value.name = "value")

# tregvt %>%
#   filter(programme == "p124") %>%
#   ggplot(aes(y = value, x = année, color = as.factor(variable))) +
#   geom_line(linewidth = 1) +
#   geom_point(shape = 21, color = "black", fill = "grey", size = 3) +
#   geom_text(aes(label = value), check_overlap = TRUE, nudge_x = 0.25, color = "black") +
#   ggtitle("GVT, p124 de 2021 à 2024") +
#   labs(color = "", y = "GVT (millions d'€)",
#        caption = "Source : Projet annuel de performances, années 2021 à 2024, programmes 124 et 155")

tregvt %>%
  filter(programme == "p124") %>%
  ggplot(aes(y = abs(value), x = année, color = as.factor(variable))) +
  geom_line(linewidth = 1) +
  geom_point(shape = 21, color = "black", fill = "grey", size = 3) +
  geom_text(aes(label = value), check_overlap = T, nudge_x = 0.25, color = "black") +
  geom_hline(yintercept = 0) +
  facet_wrap(~ variable %in% c("GVT négatif", "GVT_positif"), ncol = 1) +
  ggtitle("P124, GVT, détail gvt positif et négatif, 2021 à 2024") +
  labs(color = "", y = "GVT en valeur absolue (millions d'€)",
       caption = "Source : Projet annuel de performances, années 2021 à 2024, programmes 124 et 155") +
  theme_minimal()

tregvt %>%
  filter(programme == "p155") %>%
  ggplot(aes(y = abs(value), x = année, color = as.factor(variable))) +
  geom_line(linewidth = 1) +
  geom_point(shape = 21, color = "black", fill = "grey", size = 3) +
  geom_text(aes(label = value), check_overlap = T, nudge_x = 0.25, color = "black") +
  geom_hline(yintercept = 0) +
  facet_wrap(~ variable %in% c("GVT négatif", "GVT_positif"), ncol = 1) +
  ggtitle("P155, GVT, détail gvt positif et négatif, 2021 à 2024") +
  labs(color = "", y = "GVT en valeur absolue (millions d'€)",
       caption = "Source : Projet annuel de performances, années 2021 à 2024, programmes 124 et 155") +
  theme_minimal()

#by program + et - 
tregvt %>%
  filter(variable != "GVT solde") %>%
  ggplot(aes(y = value, x = année, group = interaction(programme, variable), color = as.factor(programme))) +
  geom_line(linewidth = 1) +
  geom_point(shape = 21, color = "black", fill = "grey", size = 3) +
  geom_text(aes(label = value), check_overlap = TRUE, nudge_x = 0.25, color = "black") +
  facet_wrap(~ variable %in% c("GVT négatif", "GVT_positif (millions d'€)"), ncol = 1) +
  ggtitle("GVT, détail gvt positif et négatif, 2021 à 2024") +
  labs(color = "", y = "GVT en valeur absolue",
       caption = "Source : Projet annuel de performances, années 2021 à 2024, programmes 124 et 155") +
  #theme_minimal() +
  facet_wrap(~ variable, dir="v", scales = "free_y")  +
  scale_color_manual(values = c("#d57254", "#54bcd5"))

## ## ## ## ## ## ##

# ggplot(ttab, aes(y = `GVT solde`, x = rownames(ttab), fill = substr(rownames(ttab), 3, 5))) +
#   geom_bar(stat = "identity") +
#   labs(x = "d_programme_année", y = "GVT solde", title = "", fill = "") +
#   theme_minimal() +
#   theme(axis.text.x = element_text(angle = 20, hjust = 1)) +
#   scale_fill_manual(values = c("#d57254", "#54bcd5"))
# 
# ggplot(ttab, aes(y = Total, x = rownames(ttab), fill = substr(rownames(ttab), 3, 5))) +
#   geom_bar(stat = "identity") +
#   labs(x = "d_programme_année", y = "Total", title = "", fill = "") +
#   theme_minimal() +
#   theme(axis.text.x = element_text(angle = 20, hjust = 1)) +
#   scale_fill_manual(values = c("#d57254", "#54bcd5"))

ggplot(ttab, aes(y = `Impact du schéma d'emplois`, 
                 x = année, 
                 fill = substr(rownames(ttab), 3, 5))) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = `Impact du schéma d'emplois`),
            position = position_dodge(width = 0.9),
            vjust = -0.25,
            size = 3) +
  labs(y = "Impact du schéma d'emplois (millions d'€)", 
       title = "",
       fill = "",
       caption = "Source : Projet annuel de performances, années 2021 à 2024, programmes 124 et 155") +
  ggtitle("Impact du schéma d'emploi par programme, 2021 à 2024") +
  theme_minimal() +
  scale_fill_manual(values = c("#d57254", "#54bcd5"))


# ggplot(ttab, aes(y = `Socle Exécution 2020 retraitée`, x = rownames(ttab), 
#                  fill = substr(rownames(ttab), 3, 5))) +
#   geom_bar(stat = "identity") +
#   labs(x = "programme_année", y = "Socle Exécution 2020 retraitée", title = "", 
#        fill = "",
#        caption = "Source : Projet annuel de performances, années 2021 à 2024, programmes 124 et 155") +
#   theme_minimal() +
#   theme(axis.text.x = element_text(angle = 20, hjust = 1)) +
#   scale_fill_manual(values = c("#d57254", "#54bcd5"))

## effectifs gérés

# effectifs <- data.frame(
#   "année" = c(2020, 2021, 2022, 2023, 2024, 2025, 2026),
#   "p124_p155" = c(17283, 12366, 12453, 12210, 12382, 12382, 12382)
# )
effectifs <- data.frame(
  "année" = c(2021, 2022, 2023, 2024, 2025, 2026),
  "p124_p155" = c(12366, 12453, 12210, 12382, 12382, 12382)
)
write.xlsx(effectifs, "data/processed/effectifs.xlsx")

# ggplot(effectifs, aes(y = p124_p155, x = année)) +
#   geom_line() +
#   geom_point(shape = 21, color = "black", fill = "#69b3a2", size = 3) +
#   geom_text(aes(label = p124_p155), check_overlap = TRUE, nudge_y = 10) +
#   ggtitle("Effectifs p124 et p155 de 2021 à 2026")

## Masse salariale
# ms <- data_frame(
#   "année" = c(2021, 2022, 2023, 2024, 2021, 2022, 2023, 2024),
#   "programme" = c("p124", "p124","p124","p124", "p155", "p155", "p155", "p155"),
#   "Total_masse_salariale" = c(285.75, 290.36, 416.91, 343.42, 394.40, 409.07, 315.24, 438.12),
#   "Combinés" = c(680.15, 680.15, 699.43, 699.43, 732.15, 732.15, 781.54, 781.54)
# )

ms <- data_frame(
  "année" = c(2021, 2022, 2023, 2024, 2021, 2022, 2023, 2024, 2021, 2022, 2023, 2024),
  "programme" = c("p124", "p124", "p124", "p124", "p155", "p155", "p155", "p155", "Combinés", "Combinés", "Combinés", "Combinés"),
  "Total_masse_salariale" = c(285.75, 290.36, 315.24, 343.42, 394.40, 409.07, 416.91, 438.12, 680.15, 699.43, 732.15, 781.54),
)
write.xlsx(ms, "data/processed/ms.xlsx")

ggplot(ms, aes(y = Total_masse_salariale, x = année, color = as.factor(programme))) +
  geom_line(linewidth = 1) +
  geom_point(shape = 21, fill = "grey", color = "black", size = 3) +
  geom_text(aes(label = Total_masse_salariale), check_overlap = TRUE, nudge_y = 20, color = "black") +
  ggtitle("Evolution de la masse salariale de 2021 à 2024") +
  scale_color_manual(values = c("#2eaf4c", "#d57254", "#54bcd5")) +
  labs(color = "Programme",
       y = "Total masse salariale   (millions €)",
       caption = "Source : Projet annuel de performances, années 2021 à 2024, programmes 124 et 155")

## Masse salariale + Effectifs

#                                  #
# EFFECTIfs en etpt. Source : PAP  #
# schéma d'emploi                  #
# source + titre                   #
#                                  #


effectifs_prog <- data_frame(
  "Service" = c("Administration centrale", "Services régionaux", "Opérateurs", "Services à l'étranger", "Services départementaux", "Autres", "Total"),
  "p_124_21" = c(2287, 767, 0, 25, 1639, 101, 4819),
  "p_124_22" = c(2323, 685.36, 24, NA, 1843.64, 110, 4986),
  "p_124_23" = c(2266.40, 708.90, 24.60, NA, 1832.10, 98, 4930),
  "p_124_24" = c(2345.50, 729.28, 24.62, NA, 1878.67, 61.50, 5039.57),
  "p_155_21" = c(1119, 1782, 0, 0, 4749, 151, 7804),
  "p_155_22" = c(1141.40, 1666.40, 1.00, NA, 5191.20, 58, 8058),
  "p_155_23" = c(1092, 1647.10, 0, 1, 4967.90, 65, 7773),
  "p_155_24" = c(1106.70, 1564.01, 1, NA,4803.41, 324.20, 7799.32)
)
write.xlsx(effectifs_prog, "data/processed/effectifs_prog.xlsx")

t <- t(effectifs_prog[, -1])
t <- as.data.frame(t)
colnames(t) <- effectifs_prog$Service

t$année <- c(2021, 2022, 2023, 2024, 2021, 2022, 2023, 2024) 
t$programme <- c("p124", "p124", "p124", "p124", "p155", "p155", "p155", "p155")

ggplot(t, aes(y = Total, x = année, group = programme, color = programme)) +
  geom_line(linewidth = 1) +
  geom_point(shape = 21, color = "black", fill = "grey", size = 3) +
  geom_text(aes(label = round(Total)), check_overlap = TRUE, nudge_y = -100, color = "black") +
  ggtitle("Effectifs (ETPT) p124 et p155 de 2021 à 2024") +
  labs(y = "Effectifs   (ETPT)",
       color ="",
       caption = "Source : Projet annuel de performances, années 2021 à 2024, programmes 124 et 155")

  
ee_ms <- merge(t, ms, by = c("année", "programme"), all = TRUE)
write.xlsx(ee_ms, "data/processed/ee_ms.xlsx")
# ee_ms %>%
#   filter(programme != "Combinés") %>%
#   ggplot(aes(x = Total, y = Total_masse_salariale, group = programme, color = programme)) +
#   geom_line(linewidth = 0.7) +
#   geom_point(shape = 21, fill = "grey", color = "black", size = 3) +
#   geom_text(aes(label = année), check_overlap = TRUE, nudge_y = 20, color = "black") +
#   geom_label_repel(aes(label = paste0(Total, "; ", Total_masse_salariale)),
#                    nudge_y = -17, color = "black", size = 3, min.segment.length = 10
#   ) +
#   ggtitle("Effectifs et masse salariale") +
#   labs(color = "")

e1 <- ee_ms %>%
  filter(programme == "p124") %>%
  ggplot(aes(y = Total, x = Total_masse_salariale)) +
  geom_line(linewidth = 0.7, color="#d57254") +
  geom_point(shape = 21, fill = "grey", color = "black", size = 3) +
  geom_text(aes(label = année), check_overlap = TRUE, nudge_y = 20, color = "black") +
  geom_label_repel(aes(label = paste0(round(Total), "; ", round(Total_masse_salariale))),
                   nudge_y = -17, color = "black", size = 3, min.segment.length = 10
  ) +
  ggtitle("Effectifs et masse salariale programme 124") +
  labs(y = "Effectifs   (ETPT)",
       x = "Total masse salariale (millions €)")

e2 <- ee_ms %>%
  filter(programme == "p155") %>%
  ggplot(aes(y = Total, x = Total_masse_salariale , color = programme)) +
  geom_line(linewidth = 0.7, color="#54bcd5") +
  geom_point(shape = 21, fill = "grey", color = "black", size = 3) +
  geom_text(aes(label = année), check_overlap = TRUE, nudge_y = 20, color = "black") +
  geom_label_repel(aes(label = paste0(round(Total), "; ", round(Total_masse_salariale))),
                   nudge_y = -17, color = "black", size = 3, min.segment.length = 10
  ) +
  ggtitle("Effectifs et masse salariale programme 155") +
  labs(y = "Effectifs   (ETPT)",
       x = "Total masse salariale (millions €)",
       caption = "Source : Projet annuel de performances, années 2021 à 2024, programmes 124 et 155")
grid.arrange(e1, e2, nrow = 2, top = "! Les axes ne sont pas à la même échelle !")
# graphiques secondaires

tre <- ttab %>% 
  select(c(1,9,12,13,17,20,24,27,28,29)) %>%
  melt(id.vars  =c("programme", "année"), value.name = "value")

ggplot(tre, aes(y = value, 
                x = année, 
                group = programme, 
                color = programme)) +
  geom_line(linewidth = 1) +
  geom_point(shape = 21, fill = "grey", color = "black", size = 3) +
  labs(x = "année", y ="en millions d'euros", 
       title = "", fill = "", color = "Programme",
       caption = "Source : Projet annuel de performances, années 2021 à 2024, programmes 124 et 155") +
  geom_hline(yintercept = 0) +
  ggtitle("Principaux facteurs d'évolution de la masse salariale, par programme, 2021 à 2024") +
  #theme_minimal() +
  scale_fill_manual(values = c("#d57254", "#54bcd5")) +
  facet_wrap(~variable, ncol = 2, scales = "free_y", 
             labeller = as_labeller(c(`Socle Exécution 2020 retraitée` = "Socle Exécution 2020 retraitée",
                                      `Impact du schéma d'emplois` = "Impact du schéma d'emplois",
                                      `Mesures catégorielles` = "Mesures catégorielles",
                                      `Mesures générales` = "Mesures générales",
                                      `GVT solde` = "GVT solde",
                                      `Rebasage de dépenses au profil atypique – hors GIPA` = "Rebasage de dépenses au profil atypique – hors GIPA",
                                      `Autres variations des dépenses de personnel` = "Autres variations des dépenses de personnel",
                                      `Total` = "Total (somme des 7 facteurs principaux)")))




















