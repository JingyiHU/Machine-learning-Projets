#learn_regresseur_x.R

#rm(list = ls())


X <- read.table('C:\\Users\\Jingyi HU\\Desktop\\Rapport SY19\\Myself_reg\\tp3_reg_app.txt', header = TRUE)

X <- as.matrix(X)

p <- ncol(X)

#X[, p] <- as.numeric(X[, p])
xapp <- X[, 1:p - 1]
yapp <- X[, p]

library('glmnet')
cv.out <- cv.glmnet(xapp, yapp, alpha = 0)
fit.lasso <-glmnet(xapp, yapp, lambda = cv.out$lambda.min, alpha = 0) 

save(p, cv.out, fit.lasso, file="regresseur_X.Rdata")
