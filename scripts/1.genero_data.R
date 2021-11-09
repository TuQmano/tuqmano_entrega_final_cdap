######## GENERO DATASET

# CARGO LIBRERIA ####
library(tidyverse) # Easily Install and Load the 'Tidyverse', CRAN v1.3.0
library(polArverse)
library(sf)

# DESCARGAR DATOS ELECTORALES ####

show_available_elections(source = "data", viewer = TRUE)

dipus_tucuman_2015_general <- get_election_data("tucuman",	"dip",	"gral",	2015,
                                               level = "departamento")


# DESCARGAR GEOMETRIAS Y GRILLAS ####

geo_tuc <- get_geo(geo = "TUCUMAN") %>% 
  add_geo_codes()

plot(geo_tuc)


grilla_tuc <- get_grid(district = "TUCUMAN")



## GUARDO OBJETOS COMO ARCHIVO ####


# DATOS
class(dipus_tucuman_2015_general)

write_csv(x = dipus_tucuman_2015_general, file = "entradas/dipus_tucuman_2015_general.csv")


# GEOMETRIA

class(geo_tuc)

write_sf(geo_tuc, "entradas/geo_tuc.geojson")


# GRILLA 


write_csv(x = grilla_tuc, file = "entradas/grilla_tuc.csv")


