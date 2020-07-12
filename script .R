sujetostest <- read.table("~/Downloads/UCI HAR Dataset/test/subject_test.txt", quote="\"",
                          comment.char="")
datatest <- read.table("~/Downloads/UCI HAR Dataset/test/X_test.txt", quote="\"",
                       comment.char="")
etiquetastest <- read.table("~/Downloads/UCI HAR Dataset/test/y_test.txt", quote="\"",
                            comment.char="")
encabezados <- read.table("~/Downloads/UCI HAR Dataset/features.txt", quote="\"", comment.char="")


# creamos una variable para renombrar datatest
nombres <- encabezados$V2
nombres1 <- as.character(nombres) 

#nombramos las variables en datatest
names(datatest) = c(nombres1)

#cargamos la libreria tidyverse para seleccionar solo las variables que contengan las 
#cualidades deseadas
library(tidyverse)

#seleccionamos solo las variables que indiquen la media y la desviacion estandar 
datos <- select(datatest, contains("mean"), contains("std"))
names(datos)

#renombrando los sujetos y las etiquetas de las actividades 
names(etiquetastest) = c("actividad")
names(sujetostest)   = c("sujetos")

#fundimos todo en un solo dataframe 
union <- cbind(sujetostest, etiquetastest, datos)

# creamos nombres unicos de las variables 
make.names(union, unique = T)
str(union)


#____________________________________________________________________________________________
# comenzamos con el proceso para los archivos de entrenamiento

sujetostrain <- read.table("~/Downloads/UCI HAR Dataset/train/subject_train.txt", quote="\"",
                           comment.char="")

datatrain <- read.table("~/Downloads/UCI HAR Dataset/train/X_train.txt", quote="\"",
                        comment.char="")

etiquetastrain <- read.table("~/Downloads/UCI HAR Dataset/train/y_train.txt", quote="\"",
                             comment.char="")


# creamos una variable para renombrar datatest y usamos nuevamente los nombres de las variables 
# dadas en el proyecto.

nombrestrain <- encabezados$V2
nombrestrain1 <- as.character(nombrestrain) 

#nombramos las variables en datatrain
names(datatrain) = c(nombrestrain1)

#cargamos la libreria tidyverse para seleccionar solo las variables que contengan las 
#cualidades deseadas como la media y la desviacion estandar 

library(tidyverse)

#seleccionamos solo las variables que indiquen la media y la desviacion estandar 
datastrain1 <- select(datatrain, contains("mean"), contains("std"))

#renombrando los sujetos y las etiquetas de las actividades en el set de datos 
names(etiquetastrain) = c("actividadtrain")
names(sujetostrain)   = c("sujetostrain")

#fundimos todo en un solo dataframe 
uniontrain <- cbind(sujetostrain, etiquetastrain, datastrain1)

# creamos nombres unicos de las variables 
make.names(uniontrain, unique = T)

# fundido de los datos en un solo marco de datos con referencia a los sujetos 

fundido <- merge(union, uniontrain, by.x = "sujetos", by.y = "sujetostrain", all = T)

# usamos el set de datos "fundido" para encontrar las medias de los sujetos por actividad 
# cargamos previamente el paquete "tidyverse".

library(tidyverse)

medias <- fundido %>%
        group_by(sujetos, actividad) %>%
        summarise(medias = mean(`tBodyAcc-mean()-X.x`, na.rm = T))

#obserbamos los tres primeros elementos de nuestro set de medias, este proceso lo podemos 
#repetir para cualquier variable deseada.
head(medias, n = 3)


#creamos un documento tipo texto para guardar nuestros datos 
write.table(fundido, file = "fundido.txt", sep = ",", 
            row.names = FALSE)
