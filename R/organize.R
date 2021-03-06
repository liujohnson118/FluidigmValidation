#' Title function to create a folder for each patient and move all files of that patient to that folder created
#'
#' @param dirFiles : directory of all original patient files
#' @author Johnson Liu
#' @return
#' @export
#'
#' @examples
organize<-function(dirFiles){
  assert_that(dir.exists(dirFiles))
  myFiles<-list.files(dirFiles)
  if(length(myFiles)<1){
    stop("No raw files. Check the files in the directory you entered")
  }
  myFiles<-myFiles[myFiles!="Mutation for every amplicons.xls"]
  if(length(myFiles)<1){
    stop("No raw files except the excel sheet for amplicons. Check the files in the directory you entered")
  }
  myFilesFull<-paste(dirFiles,myFiles,sep="/")
  allPatients<-NULL
  for(i in 1:length(myFiles)){
    allPatients<-append(allPatients,strsplit(myFiles[i],split="[-]")[[1]][2])
  }
  allPatients<-unique(allPatients)
  for(i in 1:length(allPatients)){
    dir.create(paste(dirFiles,allPatients[i],sep="/"))
  }
  for(i in 1:length(myFiles)){
    file.copy(myFilesFull[i],paste(dirFiles,"/",getPatientID(myFiles[i]),"/",myFiles[i],sep=""))
    file.remove(myFilesFull[i])
  }
}
