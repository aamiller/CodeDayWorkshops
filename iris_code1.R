## To copy these to your machine if you have a git hub account, use the 'git clone' command.


## Don't run these if you have already installed the packages
install.packages('class')
install.packages('gmodels')
install.packages('caret)
install.packages('E1071')


## But do run these!
library(class)
library(gmodels)
library(caret)

#print(iris)
#print(colnames(iris))
#table(iris$Species) 

print('Examining the Iris Dataset')
plot(iris$Sepal.Length, iris$Sepal.Width, pch=21, bg=c("red","green3","blue")[unclass(iris$Species)], main="Iris Dataset")
plot(iris$Petal.Length, iris$Petal.Width, pch=21, bg=c("red","green3","blue")[unclass(iris$Species)], main="Iris Dataset")

cor(iris$Petal.Length, iris$Petal.Width)
x=levels(iris$Species)
#print(x[1])
#print(cor(iris[iris$Species==x[1],1:4]))

#print(summary(iris))

#set a random seed
set.seed(1234)
#now partition the data and have a look (test and training sets!)
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.67, 0.33))
iris.training <- iris[ind==1, 1:4]
#print(head(iris.training))
iris.test <- iris[ind==2, 1:4]
#print(head(iris.test))

iris.trainLabels <- iris[ind==1,5]
iris.testLabels <- iris[ind==2, 5]
#print(iris.testLabels)

# Build the model
iris_pred <- knn(train = iris.training, test = iris.test, cl = iris.trainLabels, k=3)
# Inspect `iris_pred`
#print('prediction!')
#print(iris_pred)


# Put `iris.testLabels` in a data frame
irisTestLabels <- data.frame(iris.testLabels)
# Merge `iris_pred` and `iris.testLabels` 
merge <- data.frame(iris_pred, iris.testLabels)
# Specify column names for `merge`
names(merge) <- c("Predicted Species", "Observed Species")
#print(head(merge,50))

abc = confusionMatrix(iris.testLabels,iris_pred)
#print(abc)
