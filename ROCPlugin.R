library(verification)

	dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")
input <- function(inputfile) {
        pfix = prefix()
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
   myX <<- as.numeric(readLines(paste(pfix, parameters["x", 2], sep="/")))
   myY <<- as.numeric(readLines(paste(pfix, parameters["y", 2], sep="/")))
   xname <<- parameters["xname", 2]
   yname <<- parameters["yname", 2]
}

run <- function() {}

output <- function(outputfile) {
 data <- data.frame(myX, myY)
names(data)<-c(xname,yname)
p<-roc.plot(data$yes, data$no)
write.csv(p$roc.vol, outputfile)
}


