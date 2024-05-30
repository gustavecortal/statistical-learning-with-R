library(ISLR2)

# Testez les résultats de l'Analyse en Composantes Principales sur les 3 jeux de données explorés durant ce cours.
# Notez vos observations.

# Rappel : on sélectionne seulement les variables quantitatives !

X <- Carseats[, c(1,2,3,4,5,6,8,9)] # Sales of Child Car Seats: a simulated data set containing sales of child car seats at 400 different stores.
X <- Smarket[,2:6] # S&P Stock Market Data: daily percentage returns for the S&P 500 stock index between 2001 and 2005.
X <- Boston # Boston data: a data set containing housing values in 506 suburbs of Boston.

dim(X)

X <- scale(X)
pca <- princomp(X, cor = TRUE)
Z <- pca$scores # Marice contenant les composantes principales (Z)
U <- pca$loadings # Matrice contenant les axes orthogonaux (U)
lambda <- pca$sdev^2 # Variance expliquée par les composantes principales 

summary(pca)
plot(pca)

plot(cumsum(lambda)/sum(lambda), ylim = c(0,1), type = "l", xlab = "q composantes principales", ylab = "Proportion de variance expliquée")
