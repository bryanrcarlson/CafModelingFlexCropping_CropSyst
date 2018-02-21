setwd("C:\\OneDrive\\OneDrive - Washington State University (email.wsu.edu)\\Projects\\CafModelingFlexCropping\\Methods\\ModelAssessment\\RegionalRunLessPreclude\\Scenarios\\17-06-30\\seasonByLoc")

ued <- "season" #met, soil

file.pattern <- paste(ued,"_*", sep = "")
files <- list.files(pattern=file.pattern)
                    
#CHECK #files <- list.files(pattern="met_*")
#CHECK #files <- list.files(pattern="soil_*")
df <- data.frame()

for(f in 1:length(files)){
  print(cat("Processing: ", files[f], sep = ""))
  
  rot <- strsplit(files[f], "_")[[1]][2]
  if(tolower(rot) == "sc") { rot = "sC-wW" }
  if(tolower(rot) == "sw") { rot = "sW-wW" }
  if(tolower(rot) == "sp") { rot = "sP-wW" }
  
  loc <- gsub('.dat','',strsplit(files[f], "_")[[1]][3])
  f.path <- paste(getwd(), files[f], sep = "\\")
  
  if(ued == "season")
  {
    cols <- c(rep("character", 5), rep("numeric",11), rep("character",2), "integer", rep("character", 2), "integer")
  }
  else if(ued == "met")
  {
    cols <- c("integer", "NULL", "numeric", rep("character",2), "integer", rep("character", 3))
  }
  else if(ued == "soil")
  {
    cols <- c("integer", rep("numeric",3), rep("character",2), "integer", rep("character", 2), "integer")
  }
  else
  {
    stop()
  }
  
  f.df <- read.table(files[f], header=TRUE,sep="\t", colClasses = cols)
  
  if(nrow(f.df) > 0)
  {
    f.df$rotation = rot
    f.df$location = loc
    
    df <- rbind(df, f.df)
  }
}
foo <- cat(ued, "_all.dat", sep = "")

outfile <- paste(ued, "_all.dat", sep = "")
write.table(df, outfile, sep = "\t", row.names = FALSE)

#write.table(df, "season_all.dat", sep = "\t", row.names = FALSE)
#CHECK #write.table(df, "met_all.dat", sep = "\t", row.names = FALSE)
#CHECK #write.table(df, "soil_all.dat", sep = "\t", row.names = FALSE)