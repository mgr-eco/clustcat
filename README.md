# clustcat
Package to cluster categorical variables
#example clustcat

#Generate a dataset with continuous and categorical variables
set.seed(12345)
n <- 5000
p <- 3
j <- 2
K_1 <- 5
K_2 <- 7

Z <- matrix(rnorm(n * p), n, p)
colnames(Z) = paste0("Z",1:p)
X1 <- as.factor(sample(letters[1:K_1], size = n, replace = TRUE))
X2 <- as.factor(sample(letters[1:K_2], size = n, replace = TRUE))
library(fastDummies)
X = dummy_cols(data.frame(X1,X2))
X = X[,(j+1):ncol(X)]
X = X[,!grepl("_a",colnames(X))]
data = data.frame(X,Z)
data = data[,sort(names(data))]

beta = c(rep(2,2),rep(-0.5,2),rep(1,3),rep(-1,3),0.03,-0.03,0.5)
cbind(beta,colnames(data))
data = as.matrix(data)


xb = -0.5 + data %*% beta
pr = 1/(1 + exp(-xb))
summary(pr)
Y = rbinom(n=n,size=1,prob=pr)
table(Y)


data = data.frame(X1,X2,Z,Y)

#Vector of coefficients to get the order
smp_size <- floor(0.7 * nrow(data))

## Divide in training and testing
set.seed(123)
train_ind <- sample(seq_len(nrow(data)), size = smp_size)

train <- data[train_ind, ]
test <- data[-train_ind, ]

library(clustcat)

ordered = ordered_categ(train,j,data)
feasible_clusterings(train,j,data)
data_final = clustered_model(train,j,data)
