

```R
library(cvTools)
```

    Loading required package: lattice


### ``cvTuning``


```R
library("robustbase")
data("coleman")
## evaluate MM regression models tuned for 85% and 95% efficiency
tuning <- list(tuning.psi = c(3.443689, 4.685061))


```

## via model fitting function
perform cross-validation
note that the response is extracted from 'data' in
this example and does not have to be supplied



```R
cvTuning(lmrob, formula = Y ~ ., data = coleman, tuning = tuning,
cost = rtmspe, K = 5, R = 10, costArgs = list(trim = 0.1),
seed = 1234)
```

    Warning message in lmrob.S(x, y, control = control, mf = mf):
    "find_scale() did not converge in 'maxit.scale' (= 200) iterations"


    
    5-fold CV results:
      tuning.psi        CV
    1   3.443689 0.9654683
    2   4.685061 0.9867407
    
    Optimal tuning parameter:
       tuning.psi
    CV   3.443689



```R

## via function call
# set up function call
call <- call("lmrob", formula = Y ~ .)
# perform cross-validation
cvTuning(call, data = coleman, y = coleman$Y, tuning = tuning,

cost = rtmspe, K = 5, R = 10, costArgs = list(trim = 0.1),
seed = 1234)
```

    Warning message in lmrob.S(x, y, control = control, mf = mf):
    "find_scale() did not converge in 'maxit.scale' (= 200) iterations"


    
    5-fold CV results:
      tuning.psi        CV
    1   3.443689 0.9654683
    2   4.685061 0.9867407
    
    Optimal tuning parameter:
       tuning.psi
    CV   3.443689


#### ``densityplot.cv``


```R
library("robustbase")
data("coleman")
set.seed(1234) # set seed for reproducibility
## set up folds for cross-validation
folds <- cvFolds(nrow(coleman), K = 5, R = 50)
## compare LS, MM and LTS regression
# perform cross-validation for an LS regression model
fitLm <- lm(Y ~ ., data = coleman)
cvFitLm <- cvLm(fitLm, cost = rtmspe,
folds = folds, trim = 0.1)
```


```R
# perform cross-validation for an MM regression model
fitLmrob <- lmrob(Y ~ ., data = coleman, k.max = 500)
cvFitLmrob <- cvLmrob(fitLmrob, cost = rtmspe,
folds = folds, trim = 0.1)
```


```R
# perform cross-validation for an LTS regression model
fitLts <- ltsReg(Y ~ ., data = coleman)
cvFitLts <- cvLts(fitLts, cost = rtmspe,
folds = folds, trim = 0.1)
```


```R



# combine results into one object
cvFits <- cvSelect(LS = cvFitLm, MM = cvFitLmrob, LTS = cvFitLts)
cvFits

```


```R
# plot results for the MM regression model
densityplot(cvFitLmrob)
```


```R
# plot combined results
densityplot(cvFits)

```


```R
## compare raw and reweighted LTS estimators for
## 50% and 75% subsets
# 50% subsets
fitLts50 <- ltsReg(Y ~ ., data = coleman, alpha = 0.5)
cvFitLts50 <- cvLts(fitLts50, cost = rtmspe, folds = folds,
fit = "both", trim = 0.1)
# 75% subsets
fitLts75 <- ltsReg(Y ~ ., data = coleman, alpha = 0.75)
cvFitLts75 <- cvLts(fitLts75, cost = rtmspe, folds = folds,
fit = "both", trim = 0.1)
```
