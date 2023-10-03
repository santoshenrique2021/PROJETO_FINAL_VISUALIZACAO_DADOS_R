#Biblioteca
library(tidyverse)

#Tabela
df = tibble(
  FAIXA = c("F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"),
  PERCENTUAL_FPD = c(27, 25, 26, 25, 25, 23, 20, 20, 12, 11),
  VOLUMETRIA_FAIXA = c(10, 10, 10, 10, 10, 10, 10, 10, 10, 10)
)

#Organizar a variável FAIXA - defini-la como fator
df = df |> mutate(FAIXA = factor(FAIXA, levels = c(
  "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10" 
)))

#Gráfico
grafico<- ggplot(df) +
  geom_bar(aes(x = FAIXA, y = VOLUMETRIA_FAIXA), stat = "identity",
           color = "darkblue", fill = "lightblue", width = 0.7) +
  geom_line(aes(x = FAIXA, y = PERCENTUAL_FPD * 0.25), size = 2.0, color = "red", group = 1) +
  geom_label(aes(x = FAIXA, y = PERCENTUAL_FPD * 0.25, label = paste(PERCENTUAL_FPD, "%")),
             size = 4, hjust = -0.1, vjust = -0.5, color = 'black') +
  geom_hline(yintercept = 21.37 * 0.25, linetype = "dashed", color = "#CC6666",
             size = 1.25)+ 
  scale_y_continuous(sec.axis = sec_axis(~./0.25, name = "Percentual do FPD")) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1),
        text = element_text(size = 9),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.text.y = element_blank(),
        plot.title = element_text(face = "bold", size = 10.5, hjust = 0)
  ) +
  labs(title = "Taxa de inadimplência por faixa de escore",
       x = "Faixas de escore",
       y = " ")

ggsave("grafico.png", plot = grafico, width = 8, height = 6, units = "in")





