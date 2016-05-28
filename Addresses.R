# Addresses

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

for (i in 1:16){
    for (j in 1:16){
    Cell = (i-1)*16 + j
    getrow=Addresses[Cell,1]
    getcol=Addresses[Cell,2]
    }
    }
