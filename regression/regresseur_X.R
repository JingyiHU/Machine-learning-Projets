#regresseur_X.R
regresseur <- function(dataset) {
  # Mon algorithme qui renvoie les predictions sur le jeu de donnees `dataset` fourni en argument.
  load("regresseur_X.Rdata")
  
  X <- as.matrix(dataset)
  xtst <- X[, 1:p - 1]
  predictions <-predict(fit.lasso, s = cv.out$lambda.min, newx = xtst)
    
  return(predictions)
}
#####Utilisation

#X <- read.table('newdata.txt', header = TRUE)
#pred <- regresseur(X)
#mean((X[,ncol(X)] - pred) ^ 2)
#plot(X[,ncol(X)], pred, col = "red")
#abline(0,1)
