#--------------------------------------------------------
#1.Instalar y cargar librerias necesarias
install.packages("readr")
install.packages("dplyr")
install.packages("ggplot2")
library(readr)  
library(dplyr)  
library(ggplot2)

#--------------------------------------------------------
#2.Cargar datos y especificar la ruta
datos_csv<-"salarios_mujeres.csv"
datos<-read_csv(datos_csv)

#--------------------------------------------------------
#3.Revisar el dataset
#Ver primeras filas
print("Primeras 6 filas del dataset:")
head(datos)

#Info general
print("Información general del dataset:")
str(datos)

#Dimensiones
print("Dimensiones del dataset (filas x columnas):")
dim(datos)

# Nombres de las columnas
print("Nombres de las columnas:")
names(datos)

# Resumen estadístico del dataset
print("Resumen estadístico de la variable numérica:")
summary(datos)

#Media de salario
mediaSalarios<-mean(datos$Salario, na.rm = TRUE)
mediaSalarios

#Mediana salario
medianaSalario<-median(datos$Salario, na.rm = TRUE)
medianaSalario

#moda salario
modaSalario<- as.numeric(names(sort(table(datos$Salario), decreasing = TRUE) [1]))
modaSalario

#--------------------------------------------------------
#4.Limpieza de datos
# Convertir la columna de salarios a numérico y manejar valores NA
datos$Salario <- as.numeric(datos$Salario)

# Verificar valores NA después de la conversión
print("Número de valores NA por columna después de la limpieza:")
colSums(is.na(datos))

#Reemplazar los valores NA de Salario con el promedio (media)
datos$Salario[is.na(datos$Salario)] <- mediaSalarios

#Verificar la sustición de valores NA
print("Número de valores NA de la columna después de la sustitución:")
colSums(is.na(datos))

#--------------------------------------------------------
#5.Histograma, con hist y ggplot
hist(datos$Salario,
     main = "Distribución de Salarios",
     xlab = "Salarios",
     ylab = "Frecuencia",
     col = "pink")

ggplot(datos, aes(x=Salario))+
  geom_histogram( fill="yellow", color="orange")+
  labs(title="Distribución de Salarios", x="Salarios", y="Frecuencia")+
  theme_update()
