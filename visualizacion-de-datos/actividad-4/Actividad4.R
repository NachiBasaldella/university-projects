#ACTIVIDAD 4

# Paso 1: INSTALO Y CARGO los paquetes necesarios
# a) Instalo los paquetes necesarios
install.packages("titanic")
install.packages("tidyverse")

# b) Cargo los paquetes
library(titanic)
library(tidyverse)

# PASO 2: cargo y preparo los datos
# a) Cargo los datos
data <- titanic_train

# b) Veo estructura inicial
glimpse(data)

# c) Limpio los datos: quitar filas con NA en Age o Embarked
data_clean <- data %>%
  filter(!is.na(Age), !is.na(Embarked))

# PASO 3: Visualizaciones clave

# a) Supervivencia general
ggplot(data_clean, aes(x = factor(Survived))) +
  geom_bar(fill = "steelblue") +
  labs(title = "Supervivencia general", x = "Sobrevivió (0 = No, 1 = Sí)", y = "Cantidad")

# b) Supervivencia por sexo
ggplot(data_clean, aes(x = Sex, fill = factor(Survived))) +
  geom_bar(position = "fill") +
  scale_y_continuous(labels = scales::percent) +
  labs(title = "Supervivencia por sexo", x = "Sexo", y = "Porcentaje", fill = "Sobrevivió")

# c) Supervivencia por clase y sexo
ggplot(data_clean, aes(x = Pclass, fill = factor(Survived))) +
  geom_bar(position = "fill") +
  facet_wrap(~Sex) +
  labs(title = "Supervivencia por clase y sexo", x = "Clase", y = "Porcentaje", fill = "Sobrevivió")

# d) Distribución de edad por supervivencia
ggplot(data_clean, aes(x = Age, fill = factor(Survived))) +
  geom_histogram(binwidth = 5, position = "identity", alpha = 0.6) +
  labs(title = "Distribución de edad por supervivencia", x = "Edad", y = "Cantidad", fill = "Sobrevivió")

#ANEXO 
# Instalar
install.packages("shiny")

# cargo paquete
library(shiny)
data <- titanic::titanic_train %>%
  filter(!is.na(Age), !is.na(Embarked))

ui <- fluidPage(
  titlePanel("Visualización Interactiva - Titanic"),
  sidebarLayout(
    sidebarPanel(
      selectInput("grafico", "Selecciona el gráfico:",
                  choices = c("Supervivencia general", 
                              "Supervivencia por sexo", 
                              "Supervivencia por clase y sexo", 
                              "Distribución de edad"))
    ),
    mainPanel(
      plotOutput("graficoPlot")
    )
  )
)

server <- function(input, output) {
  output$graficoPlot <- renderPlot({
    if (input$grafico == "Supervivencia general") {
      ggplot(data, aes(x = factor(Survived))) +
        geom_bar(fill = "steelblue") +
        labs(x = "Sobrevivió", y = "Cantidad")
      
    } else if (input$grafico == "Supervivencia por sexo") {
      ggplot(data, aes(x = Sex, fill = factor(Survived))) +
        geom_bar(position = "fill") +
        scale_y_continuous(labels = scales::percent) +
        labs(x = "Sexo", y = "Porcentaje", fill = "Sobrevivió")
      
    } else if (input$grafico == "Supervivencia por clase y sexo") {
      ggplot(data, aes(x = Pclass, fill = factor(Survived))) +
        geom_bar(position = "fill") +
        facet_wrap(~Sex) +
        labs(x = "Clase", y = "Porcentaje", fill = "Sobrevivió")
      
    } else if (input$grafico == "Distribución de edad") {
      ggplot(data, aes(x = Age, fill = factor(Survived))) +
        geom_histogram(binwidth = 5, alpha = 0.6, position = "identity") +
        labs(x = "Edad", y = "Cantidad", fill = "Sobrevivió")
    }
  })
}

shinyApp(ui = ui, server = server)


