#' Title function to rename vcf files to txt files in not using Windows machine if the files are not already txt files
#'
#' @param dirFiles : directory for all files at the beginning of the program
#' @author Johnson Liu
#' @return
#' @export
#'
#' @examples "PAT-ID95-DNA-ID149-OP-D2_S12.vcf" would become "PAT-ID95-DNA-ID149-OP-D2_S12.txt"
#'
renameToTxt<-function(dirFiles){
  assert_that(dir.exists(dirFiles))
  allFiles<-list.files(dirFiles,full.names = TRUE)
  for(i in 1:length(allFiles)){
    if(substr(allFiles[i],(nchar(allFiles[i])-3),nchar(allFiles[i]))!=".txt"){
      newFileName<-gsub(".vcf",".txt",allFiles[i])
      file.rename(from=allFiles[i],to=newFileName)
    }
  }
}
