CharSet <- c(as.character(1:9),LETTERS[1:7])


####################################################################

paste("row",sprintf("%02.0f",1:16),sep="")-> rows
paste("col",sprintf("%02.0f",1:16),sep="")-> cols
paste("grid",sprintf("%02.0f",1:16),sep="")-> grids

####################################################################

# InitialSetDifference

row01<-CharSet; row02<-CharSet; row03<-CharSet; row04<-CharSet
row05<-CharSet; row06<-CharSet; row07<-CharSet; row08<-CharSet
row09<-CharSet; row10<-CharSet; row11<-CharSet; row12<-CharSet
row13<-CharSet; row14<-CharSet; row15<-CharSet; row16<-CharSet

col01<-CharSet; col02<-CharSet; col03<-CharSet; col04<-CharSet
col05<-CharSet; col06<-CharSet; col07<-CharSet; col08<-CharSet
col09<-CharSet; col10<-CharSet; col11<-CharSet; col12<-CharSet
col13<-CharSet; col14<-CharSet; col15<-CharSet; col16<-CharSet

grid01<-CharSet; grid02<-CharSet; grid03<-CharSet; grid04<-CharSet; 
grid05<-CharSet; grid06<-CharSet; grid07<-CharSet; grid08<-CharSet; 
grid09<-CharSet; grid10<-CharSet; grid11<-CharSet; grid12<-CharSet; 
grid13<-CharSet; grid14<-CharSet; grid15<-CharSet; grid16<-CharSet;

####################################################################
CandidateList <-list(row01, row02, row03, row04,
row05, row06, row07, row08,
row09, row10, row11, row12,
row13, row14, row15, row16,
col01, col02, col03, col04,
col05, col06, col07, col08,
col09, col10, col11, col12,
col13, col14, col15, col16,
grid01, grid02, grid03, grid04, 
grid05, grid06, grid07, grid08, 
grid09, grid10, grid11, grid12, 
grid13, grid14, grid15, grid16)

####################################################################

CellValues <-rep(NA,256)

rows <- rep(1:16,each=16); cols <- rep(1:16,16)

grids <- c(rep(rep(1:4,each=4),4),
           rep(rep(5:8,each=4),4),
           rep(rep(9:12,each=4),4),
           rep(rep(13:16,each=4),4))

Addresses <- data.frame(CellValues,rows,cols,grids)

####################################################################


for(i in 1:115)
{



if( is.na(Addresses$CellValues[i] ) ){
getRow <- Addresses$rows[i]
getCol <- Addresses$cols[i]
getGrid <- Addresses$grids[i]

List1 <- CandidateList[[getGrid]] 
List2 <- CandidateList[[getRow]]
List3 <- CandidateList[[getCol]]

Candidates <- union(List1,union(List2,List3))

MakeItem <- sample(Candidates,1)

Addresses$CellValues[i] <- MakeItem

CandidateList[[getRow]]  <- setdiff(CandidateList[[getRow]] ,MakeItem)
CandidateList[[getCol]]  <- setdiff(CandidateList[[getCol]] ,MakeItem)
CandidateList[[getGrid]]  <- setdiff(CandidateList[[getGrid]] ,MakeItem)


cat("\n", CandidateList[[getRow]] )
cat("\n", CandidateList[[getCol]] )
cat("\n", CandidateList[[getGrid]] )

}



}



