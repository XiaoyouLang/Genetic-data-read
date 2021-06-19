library(plink2R)

Genegroup <- function(Path){
  
  genename_list <- list.files(path=Path,pattern = '*.bed')
  length(paste(Path,genename_list,sep=''))
  
  gene_list <- list()
  
  for (gene_name in genename_list) {
    newname <- sub('.bed','',gene_name)
    
    gene <- read_plink(paste0(Path,'/',newname))
    gene_list[[newname]] <- gene$bed[,apply(gene$bed,2,sd)!=0]
  }
  invisible(gene_list)
}
