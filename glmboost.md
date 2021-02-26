
https://rpubs.com/crossxwill/mboost

### glmboost

* Fit a glm using a boosting algorithm (as opposed to MLE). 
* Unlike the glm function, glmboost will perform variable selection. 
* After fitting the model, score the test data set and measure the AUC.




```R
library(caret)

## Loading required package: lattice
## Loading required package: ggplot2

data(GermanCredit)

set.seed(1984)

training <- createDataPartition(GermanCredit$Class, p = 0.6, list=FALSE)

trainData <- GermanCredit[training,]
testData <- GermanCredit[-training,]
```


```R
fitControl <- trainControl(method = "repeatedcv",
                           number = 5,
                           repeats = 10,
                           ## Estimate class probabilities
                           classProbs = TRUE,
                           ## Evaluate performance using 
                           ## the following function
                           summaryFunction = twoClassSummary)




```


```R
set.seed(2014);
glmBoostModel <- train(Class ~ ., data=trainData, 
                       method = "glmboost", 
                       metric="ROC", 
                       trControl = fitControl, 
                       tuneLength=5, center=TRUE, 
                       family=Binomial(link = c("logit")))
```
