library("randomForest")
X <- read.table('C:\\Users\\Jingyi HU\\Desktop\\Rapport SY19\\Myself_reg\\tp3_clas_app.txt', header = TRUE)

X$y <- as.factor(X$y)

n<- nrow(X)
napp<- round(2*n/3) 
ntst<-n-napp

train<-sample(1:n,round(2*n/3))

train_set <- X[train,]
test_set <- X[-train,]

# Creation magique (et naive) de la foret
rf <- randomForest(y ~ ., data = train_set)
plot(rf) # Analyse de l'erreur en fonction de la taille des arbres et du nombre d'arbres
#P = dim(train_set)[2]#le nombre de colonnes
#mtry = floor(sqrt(P)) # valeur empirique optimale pour un pbm de classification
#rfopt <- randomForest(y ~ ., data = train_set, ntree = 50, mtry = mtry)
#ntree = 50 selon le graphique


#Faut v¨¦rifier est-ce qu'il a besoin de Cross-Validation peut-etre changer

#predictions <- predict(rfopt, newdata = test_set[, 1:30], type = 'class')
predictions <- predict(rf, newdata = test_set[, 1:30], type = 'class')
erreur <- mean(predictions != test_set$y)
save(rf, file="classifieur_X.Rdata")
