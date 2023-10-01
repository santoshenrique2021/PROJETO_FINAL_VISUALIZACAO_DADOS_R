#Etapa 1 - Organização da base de dados

#Bibliotecas utilizadas
library(tidytuesdayR)
library(tidyverse)


#Extração dos dados (raw data)
##Parte 1
tuesdata <- tidytuesdayR::tt_load('2023-02-07')
tuesdata <- tidytuesdayR::tt_load(2023, week = 6)
##Parte 2
#Dados dos preços das empresas
big_tech_stock_prices <- tuesdata$big_tech_stock_prices
big_tech_stock_prices |> view()

#Nome das empresas
big_tech_companies <- tuesdata$big_tech_companies
big_tech_companies |> view()

#Organização da base de dados

##Parte 1 - Left Join para unir os dois data frames
df<- left_join(big_tech_stock_prices, big_tech_companies,
               by = "stock_symbol")
##Visualização
df |> view()

##Parte 2 - Selecionar as variáveis relevantes
df_final<- df |> select (stock_symbol, company, date, close)

##Parte 3 - Renomear o nome das colunas
df_final <- df_final %>% 
  rename("SIMBOLO" = "stock_symbol", "EMPRESA" = "company",
         "REF_DATE" = "date", "PRECO" = "close")

#Visualização
df_final |> view()

##Parte 4 - Salvar o data frame
write.csv(df_final, "dataset_preco.csv", row.names=FALSE)
