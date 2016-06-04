

library(dplyr)
library(magrittr)

n<-158

InitialCells <- sample(1:256,n)






CellValues <-rep(NA,256)
CellValues[InitialCells] <- InitialCharSet

####################################################

paste("row",sprintf("%02.0f",1:16),sep="")-> rows
paste("col",sprintf("%02.0f",1:16),sep="")-> cols
paste("grid",sprintf("%02.0f",1:16),sep="")-> grids

CellIDS <- 1:256
cols <- rep(cols,16)
rows <- rep(rows,each=16)
grids <- c(rep(rep(grids[1:4],each=4),4),
           rep(rep(grids[5:8],each=4),4),
           rep(rep(grids[9:12],each=4),4),
           rep(rep(grids[13:16],each=4),4))


Addresses <- data.frame(rows,cols,grids)

##################################################


for(k in 1:16)
{
rowVals <- MakeFrame %>% filter(rows==paste("row",sprintf("%02.0f",k),sep="")) %>% select(CellValues)
colVals <- MakeFrame %>% filter(cols==paste("col",sprintf("%02.0f",k),sep="")) %>% select(CellValues)
gridVals <- MakeFrame %>% filter(grids==paste("grid",sprintf("%02.0f",k),sep="")) %>% select(CellValues)

WhichExcess <- colVals$CellValues[sort(table(colVals$CellValues),T)>1]
NumExcess <- length(colVals$CellValues[sort(table(colVals$CellValues),T)>1])
CanUse <- setdiff(CharSet,WhichExcess)
colVals$CellValues[sort(table(colVals$CellValues),T)>1]<- sample(CanUse,NumExcess)




}

##################################################

WhichExcess <- colVals$CellValues[sort(table(colVals$CellValues),T)>1]
NumExcess <- length(colVals$CellValues[sort(table(colVals$CellValues),T)>1])
CanUse <- setdiff(CharSet,WhichExcess)
WhichExcesssample(CanUse,WhichExcess)


##################################################

MakeFrame <- data.frame(CellValues,Addresses)

i=1

getRow <- as.character(MakeFrame$rows[i])
getCol <- as.character(MakeFrame$cols[i])
getGrid <- as.character(MakeFrame$grids[i])

for(j in 1:20){

cat("\n","missing cells:", sum(is.na(MakeFrame$CellValues)))


#################################### Part 1

for(k in 1:16)
{
rowVals <- MakeFrame %>% filter(rows==paste("row",sprintf("%02.0f",k),sep="")) %>% select(CellValues)
colVals <- MakeFrame %>% filter(cols==paste("col",sprintf("%02.0f",k),sep="")) %>% select(CellValues)
gridVals <- MakeFrame %>% filter(grids==paste("grid",sprintf("%02.0f",k),sep="")) %>% select(CellValues)



if (sum(is.na(rowVals$cellValues))==1){MakeFrame$CellValues[i]=setdiff(CharSet,rowVals$cellValues)}
if (sum(is.na(colVals$cellValues))==1){MakeFrame$CellValues[i]=setdiff(CharSet,colVals$cellValues)}
if (sum(is.na(gridVals$cellValues))==1){MakeFrame$CellValues[i]=setdiff(CharSet,gridVals$cellValues)}

}

#################################### Part 2



for(i in 1:256)
{
getRow <- as.character(MakeFrame$rows[i])
getCol <- as.character(MakeFrame$cols[i])
getGrid <- as.character(MakeFrame$grids[i])

ExtantValues <- sort(union(union(rowVals$CellValues,colVals$CellValues),gridVals$CellValues))

Candidates <- setdiff(CharSet,ExtantValues)
if (length(Candidates)==1){MakeFrame$CellValues[i]=Candidates}
}

}
