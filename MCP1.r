n<-96

InitialCells <- sample(1:256,n)
CharSet <- c(as.character(1:9),LETTERS[1:7])

InitialCharSet <- sample(CharSet,n,replace=T)

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

MakeFrame <- data.frame(CellValues,Addresses)

i=1

getRow <- as.character(MakeFrame$rows[i])
getCol <- as.character(MakeFrame$cols[i])
getGrid <- as.character(MakeFrame$grids[i])
