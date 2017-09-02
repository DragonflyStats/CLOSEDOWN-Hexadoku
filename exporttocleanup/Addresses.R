# Addresses

paste("row",sprintf("%02.0f",1:16),sep="")-> rows
paste("col",sprintf("%02.0f",1:16),sep="")-> cols
paste("grid",sprintf("%02.0f",1:16),sep="")-> grids

CellIDS <- 1:256
cols <- rep(cols,16)
rows <- rep(rows,each=16)
grids <- c(rep(rep(rows[1:4],each=4),4),
           rep(rep(rows[5:8],each=4),4),
           rep(rep(rows[9:12],each=4),4),
           rep(rep(rows[13:16],each=4),4))


Addresses <- data.frame(rows,cols,grids)

for (i in 1:16){
    for (j in 1:16){
    Cell = (i-1)*16 + j
    getrow=Addresses[Cell,1]
    getcol=Addresses[Cell,2]
    }
    }
################################################################

CellIDS <- 1:256

rownum <- rep(1:16,each=16)
colnum <- rep(1:16,16)
gridnum <- c(rep(rep(1:4,each=4),4),
           rep(rep(5:8,each=4),4),
           rep(rep(9:12,each=4),4),
           rep(rep(13:16,each=4),4))
Addresses2 <- data.frame(rownum,colnum,gridnum)

################################################################
