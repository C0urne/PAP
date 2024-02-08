













ggplot(ttab, aes(y = `Impact du schéma d'emplois`, 
                 x = année, 
                 group = programme, 
                 color = programme,
                 fill = substr(rownames(ttab), 3, 5))) +
  geom_line(linewidth = 1) +
  geom_point(shape = 21, fill = "grey", color = "black", size = 3) +
  labs(x = "d_programme_année", y = "Impact du schéma d'emplois", 
       title = "", fill = "") +
  geom_hline(yintercept = 0) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 20, hjust = 1)) +
  scale_fill_manual(values = c("#d57254", "#54bcd5"))


ggplot(ttab, aes(y = `Impact du schéma d'emplois`, 
                 x = année, 
                 fill = substr(rownames(ttab), 3, 5))) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(label = ttab$`Impact du schéma d'emplois`, nudge_x = 0) +
  labs(y = "Impact du schéma d'emplois", 
       title = "",
       fill = "") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 20, hjust = 1)) +
  scale_fill_manual(values = c("#d57254", "#54bcd5"))


ggplot(ttab, aes(y = `Impact du schéma d'emplois`, 
                 x = année, 
                 fill = substr(rownames(ttab), 3, 5))) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = `Impact du schéma d'emplois`),
            position = position_dodge(width = 0.9),
            vjust = -0.25,
            size = 3) +
  labs(y = "Impact du schéma d'emplois", 
       title = "",
       fill = "") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 20, hjust = 1)) +
  scale_fill_manual(values = c("#d57254", "#54bcd5"))


# all main value of the ms
ttab %>%
  select(c(1,9,12,13,17,20,24,27,28,29)) %>%
    ggplot(aes(y = value, 
                     x = année, 
                     group = programme, 
                     color = programme,
                     fill = substr(rownames(ttab), 3, 5))) +
      geom_line(linewidth = 1) +
      geom_point(shape = 21, fill = "grey", color = "black", size = 3) +
      labs(x = "d_programme_année", y = "Impact du schéma d'emplois", 
           title = "", fill = "") +
      geom_hline(yintercept = 0) +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 20, hjust = 1)) +
      scale_fill_manual(values = c("#d57254", "#54bcd5"))




# Create a sample dataset
data <- data.frame(
  var = rep(c("age", "height"), each = 10),
  year = rep(2011:2020, 2),
  value = c(rnorm(10, mean = 40, sd = 5), rnorm(10, mean = 70, sd = 5))
)

# Create line plots for each variable using facet_wrap()
ggplot(data, aes(x = year, y = value, group = 1)) +
  geom_line(linewidth = 1) +
  geom_point(shape = 21, fill = "grey", color = "black", size = 3) +
  labs(x = "Year", y = "Value",
       title = "Line Plots for Age and Height",
       color = "") +
  facet_wrap(~var, ncol = 1) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 20, hjust = 1))




tre <- ttab %>% 
  select(c(1,9,12,13,17,20,24,27,28,29)) %>%
  melt(id.vars  =c("programme", "année"), value.name = "value")

ggplot(tre, aes(y = value, 
           x = année, 
           group = programme, 
           color = programme)) +
  geom_line(linewidth = 1) +
  geom_point(shape = 21, fill = "grey", color = "black", size = 3) +
  labs(x = "année", y ="", 
       title = "", fill = "") +
  geom_hline(yintercept = 0) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 20, hjust = 1)) +
  scale_fill_manual(values = c("#d57254", "#54bcd5")) +
  facet_wrap(~variable, ncol = 1, scales = "free_y")



tregvt <- ttab %>% 
  select(c(17,18,19,28,29)) %>%
  melt(id.vars  =c("programme", "année"), value.name = "value")

tregvt %>%
  filter(programme == "p124") %>%
  ggplot(aes(y = value, x = année, color = as.factor(variable))) +
    geom_line(linewidth = 1) +
    geom_point(shape = 21, color = "black", fill = "grey", size = 3) +
    geom_text(aes(label = value), check_overlap = TRUE, nudge_x = 0.25, color = "black") +
    ggtitle("GVT p124 et p155 de 2021 à 2024") +
    #scale_color_manual(values = c("#d57254", "#54bcd5")) +
    labs(color = "")

tregvt %>%
  filter(programme == "p124") %>%
    ggplot(aes(y = abs(value), x = année, color = as.factor(variable))) +
    geom_line(linewidth = 1) +
    geom_point(shape = 21, color = "black", fill = "grey", size = 3) +
    geom_text(aes(label = value), check_overlap = TRUE, nudge_x = 0.25, color = "black") +
    geom_hline(yintercept = 0) +
    facet_wrap(~ variable %in% c("GVT négatif", "GVT_positif"), ncol = 1) +
    ggtitle("P124, GVT, détail gvt positif et négatif, 2021 à 2024") +
    labs(color = "", y = "GVT en valeur absolue") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 20, hjust = 1))

tregvt %>%
  filter(programme == "p155") %>%
    ggplot(aes(y = abs(value), x = année, color = as.factor(variable))) +
    geom_line(linewidth = 1) +
    geom_point(shape = 21, color = "black", fill = "grey", size = 3) +
    geom_text(aes(label = value), check_overlap = TRUE, nudge_x = 0.25, color = "black") +
    geom_hline(yintercept = 0) +
    facet_wrap(~ variable %in% c("GVT négatif", "GVT_positif"), ncol = 1) +
    ggtitle("P155, GVT, détail gvt positif et négatif, 2021 à 2024") +
    labs(color = "", y = "GVT en valeur absolue") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 20, hjust = 1))
  
#by program + et - 
tregvt %>%
  filter(variable != "GVT solde") %>%
  ggplot(aes(y = value, x = année, group = interaction(programme, variable), color = as.factor(programme))) +
  geom_line(linewidth = 1) +
  geom_point(shape = 21, color = "black", fill = "grey", size = 3) +
  geom_text(aes(label = value), check_overlap = TRUE, nudge_x = 0.25, color = "black") +
  geom_hline(yintercept = 0) +
  facet_wrap(~ variable %in% c("GVT négatif", "GVT_positif"), ncol = 1) +
  ggtitle("P155, GVT, détail gvt positif et négatif, 2021 à 2024") +
  labs(color = "", y = "GVT en valeur absolue") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 20, hjust = 1))

tregvt %>%
  filter(variable != "GVT solde") %>%
  ggplot(aes(y = value, x = année, group = interaction(programme, variable), color = as.factor(programme))) +
  geom_line(linewidth = 1) +
  geom_point(shape = 21, color = "black", fill = "grey", size = 3) +
  geom_text(aes(label = value), check_overlap = TRUE, nudge_x = 0.25, color = "black") +
  facet_wrap(~ variable %in% c("GVT négatif", "GVT_positif"), ncol = 1) +
  ggtitle("P155, GVT, détail gvt positif et négatif, 2021 à 2024") +
  labs(color = "", y = "GVT en valeur absolue") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 20, hjust = 1)) +
  facet_wrap(~ variable, dir="v", scales = "free_y")


  
  
  ## ## ##

ee_ms %>%
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

ee_ms %>%
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

  
  
  
  
ee_ms %>%
  filter(programme != "Combinés") %>%
  ggplot(aes(y = Total, x = Total_masse_salariale)) +
  geom_line(linewidth = 0.7) +
  geom_point(shape = 21, fill = "grey", color = "black", size = 3) +
  geom_text(aes(label = année), check_overlap = TRUE, nudge_y = 20, color = "black") +
  geom_label_repel(aes(label = paste0(round(Total), "; ", round(Total_masse_salariale))),
                   nudge_y = -17, color = "black", size = 3, min.segment.length = 10
  ) +
  facet_wrap(~ programme, nrow = 1, scales = "free_x") +
  scale_color_manual(values = c("#d57254", "#54bcd5")) +
  labs(y = "Effectifs   (ETPT)",
       x = "Total masse salariale (millions €)",
       color = "Programme",
       caption = "Source : Projet annuel de performances, années 2021 à 2024, programmes 124 et 155") +
  theme(strip.background = element_blank(),
        strip.text = element_text(face = "italic"))  
  
  
  
  
  
  
  
  
  