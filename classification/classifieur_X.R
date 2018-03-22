classifieur <- function(dataset) {
  # Mon algorithme qui renvoie les pr¨¦dictions sur le jeu de donn¨¦es `dataset` fourni en argument.
  load("classifieur_X.Rdata") #rf
  
  probs <- predict(rf, newdata = dataset[, 1:30], type = 'class')
  erreur <- mean(probs != dataset$y)
  predictions <- 1 - erreur
 
  return(predictions)
  
}


#####Utilisation:

#Xtry <- read.table('tp3_clas_app.txt', header = TRUE)
#predictions <- classifieur(Xtry)

