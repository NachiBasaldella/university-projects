#ACTIVIDAD 3

#PASO 1 carga y preparación de datos

# a) - Cargo de librerías necesarias
library(readxl)     # Para leer archivos Excel
library(dplyr)      # Para manipulación de datos
library(lubridate)  # Para trabajar con fechas
library(stringr)    # Para trabajar con texto
library(tibble)     # Para mejorar la visualización de tablas

# b) - Cargo el archivo Excel
datos <- read_excel("C:/Users/nazar/OneDrive/Documentos/Actividad 3/datos_traducidos_trustpilot.xlsx")

# c) - Reviso los nombres de columnas
colnames(datos)

# d) - Hago un vistazo a las primeras filas
head(datos)

# e) - Verifico tipos de datos
str(datos)

# f) - Convierto fecha a formato Date si es necesario
# Verifico si ya es date primero y sino la cambio 
datos <- datos %>%
  mutate(Fecha = as.Date(Fecha))

# g) - Compruebo si hay valores faltantes
summary(datos)

# h) - Elimino reseñas vacías o NA en 'descripcion'
datos <- datos %>%
  filter(!is.na(descripcion), descripcion != "")

# PASO 2: Analizo los sentimientos con tidytext + NRC (en español)

# a) Instalo y cargo paquetes necesarios

library(tidytext)
library(dplyr)
library(tidyr)
library(ggplot2)
library(readr)

# b) Cargo un diccionario NRC en español manualmente
library(readr)

nrc_es <- read_csv("C:/Users/nazar/OneDrive/Documentos/Actividad 3/nrc_espanol_ejemplo.csv")
head(nrc_es)

# c) Tokenizar (convierto el texto en palabras individuales)

library(tidytext)
library(dplyr)
library(stringr)

# Tokenización: una palabra por fila
datos_token <- datos %>%
  select(Plataforma, Puntuacion, Descripcion, Fecha) %>%
  unnest_tokens(input = Descripcion, output = palabra, token = "words", to_lower = TRUE) %>%
  filter(str_detect(palabra, "[a-záéíóúñ]"))  

head(datos_token)
 
# d) Uno con el diccionario NRC

# Uno palabras tokenizadas con el diccionario NRC
sentimientos <- datos_token %>%
  inner_join(nrc_es, by = "palabra") %>%
  filter(Valor == 1)

head(sentimientos)

# e) Cuento emociones detectadas por plataforma
resumen_sentimientos <- sentimientos %>%
  count(Plataforma, sentimiento, sort = TRUE)

print(resumen_sentimientos)

# PASO 3 Visualización: emociones por puntuación (estrellas) y plataforma

# a) # Agrupo por plataforma, puntuación y sentimiento
sentimiento_por_puntuacion <- sentimientos %>%
  count(Plataforma, Puntuacion, sentimiento)
 
# b) # Gráfico de barras
ggplot(sentimiento_por_puntuacion, aes(x = factor(Puntuacion), y = n, fill = sentimiento)) +
  geom_col(position = "dodge") +
  facet_wrap(~Plataforma) +
  labs(title = "Sentimientos por puntuación y plataforma",
       x = "Puntuación (estrellas)",
       y = "Cantidad de palabras con sentimiento") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0))

#PASO 4: Visualización de sentimientos a lo largo del tiempo

# a) Agrupo emociones por fecha y plataforma

sentimiento_tiempo <- sentimientos %>%
  count(Fecha, Plataforma, sentimiento)

# b) Gráfico de líneas por sentimiento

# Aqui el gráfico no era claro, por lo que tengo que hacer algunas correcciones para lograr un mejor gráfico
# Vuelvo a crear datos_token incluyendo Fecha y asegurando que es tipo Date
datos_token <- datos %>%
  select(Plataforma, Puntuacion, Descripcion, Fecha_limpia) %>%
  rename(Fecha = Fecha_limpia) %>%  # renombramos para que siga funcionando el resto
  unnest_tokens(input = Descripcion, output = Palabra, token = "words", to_lower = TRUE) %>%
  filter(str_detect(Palabra, "[a-záéíóúñ]"))
# Uno con el diccionario NRC 
sentimientos <- datos_token %>%
  inner_join(nrc_es, by = "palabra") %>% 
  filter(Valor == 1)

# Agrupo por mes y grafico
sentimiento_tiempo <- sentimientos %>%
  mutate(mes_anio = floor_date(Fecha, "month")) %>%
  count(mes_anio, Plataforma, sentimiento)

# Elijo las 3 plataformas con más datos
top_plataformas <- sentimientos %>%
  count(Plataforma) %>%
  top_n(3, n) %>%
  pull(Plataforma)
# Filtro
sentimiento_filtrado <- sentimiento_tiempo %>%
  filter(Plataforma %in% top_plataformas)

# Gráfico final
ggplot(sentimiento_filtrado, aes(x = mes_anio, y = n, fill = sentimiento)) +
  geom_col(position = "dodge") +
  facet_wrap(~Plataforma) +
  labs(title = "Frecuencia mensual de emociones por plataforma",
       x = "Mes y año",
       y = "Cantidad de palabras con sentimiento") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#PASO 5 Wordcloud por plataforma

# a) Cargo librerias

library(wordcloud)
library(tm)
library(RColorBrewer)

# b) Eliminar stopwords en español
# Creo dataset sin palabras vacías
datos_limpios <- datos_token %>%
  filter(!palabra %in% stopwords("spanish"))  

# c) Filtro por palabras de una sola plataforma
ebay_palabras <- datos_limpios %>%
  filter(Plataforma == "ebay.com") %>%
  count(palabra, sort = TRUE)

# d) Genero wordcloud para esa plataforma

wordcloud(words = ebay_palabras$palabra,
          freq = ebay_palabras$n,
          max.words = 100,
          random.order = FALSE,
          colors = brewer.pal(8, "Dark2"))






