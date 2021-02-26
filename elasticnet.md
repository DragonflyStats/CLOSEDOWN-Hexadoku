

```R
install.packages('elasticnet')
library(elasticnet)

age <- c(4,8,7,12,6,9,10,14,7) 
gender <- c(1,0,1,1,1,0,1,0,0)
bmi_p <- c(0.86,0.45,0.99,0.84,0.85,0.67,0.91,0.29,0.88)
m_edu <- c(0,1,1,2,2,3,2,0,1)
p_edu <- c(0,2,2,2,2,3,2,0,0)
#f_color <- c("blue", "blue", "yellow", "red", "red", "yellow", "yellow", "red", "yellow")
f_color <- c(0, 0, 1, 2, 2, 1, 1, 2, 1)
asthma <- c(1,1,0,1,0,0,0,1,1)
pred <- cbind(age, gender, bmi_p, m_edu, p_edu, f_color)



enet(x=pred, y=asthma, lambda=0)
```

    Installing package into '/home/nbcommon/R'
    (as 'lib' is unspecified)
    Loading required package: lars
    Loaded lars 1.2
    



    
    Call:
    enet(x = pred, y = asthma, lambda = 0)
    Cp statistics of the Lasso fit 
    Cp: -1.819 -1.401  0.556  1.435  1.317  1.306  3.017  5.014  7.000 
    DF: 1 2 3 4 4 4 5 6 7 
    Sequence of  moves:
         p_edu m_edu bmi_p f_color m_edu age m_edu gender  
    Var      5     4     3       6    -4   1     4      2 9
    Step     1     2     3       4     5   6     7      8 9

