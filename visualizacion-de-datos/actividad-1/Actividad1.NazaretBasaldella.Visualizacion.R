# Trabajo práctico en R
# Ejercicio 1: Cargar el dataset mtcars (no es necesario attach)
# Simplemente usamos mtcars directamente
mtcars

# Ejercicio 2: Gráfico mejorado de puntos con mileage vs weight
plot(mtcars$mpg, mtcars$wt, xlab = "Weight", ylab = "Mileage", main = "Relación peso-mpg")
text(mtcars$mpg, mtcars$wt, labels = rownames(mtcars), cex = 0.6, pos = 4, offset = 0.5)

# Ejercicio 3: Imprime todos los objetos del entorno actual
ls()

# Ejercicio 4: Borra todos los objetos del entorno actual
rm(list = ls())

# Ejercicio 5: Crea un data.frame vacío con 10 columnas y 10 filas
empty_df <- as.data.frame(matrix(NA, nrow = 10, ncol = 10))

# Ejercicio 6: Crea otro data.frame con 5 columnas y 5 filas
small_df <- as.data.frame(matrix(NA, nrow = 5, ncol = 5))

# Ejercicio 7: Elimina solo el primer data.frame
rm(empty_df)

# Ejercicio 8: Crea una función que sume uno a cualquier número
addOne <- function(x) {
  x + 1
}

# Ejemplo:
# addOne(3)
# [1] 4

# Ejercicio 9: Crea una función que sume uno solo a los números impares
addOneIfOdd <- function(x) {
  if (x %% 2 == 1) {
    x + 1
  } else {
    x
  }
}

# Ejemplo:
# addOneIfOdd(3)
# [1] 4

# addOneIfOdd(2)
# [1] 2

# Ejercicio 10: Crea una función que cuente cuántas veces se encuentra un valor en un vector
countTimes <- function(vec, value) {
  count <- 0
  for (i in 1:length(vec)) {
    if (vec[i] == value) {
      count <- count + 1
    }
  }
  count
}

# Ejemplo:
# vectorTest <- c(1, 2, 3, 7, 4, 5, 7, 2, 7)
# countTimes(vectorTest, 7)
# [1] 3

# vectorTest2 <- c("hola", "cómo", "eres", "tú", "?", "lo siento", "quién", "eres", "tú")
# countTimes(vectorTest2, "eres")
# [1] 2

