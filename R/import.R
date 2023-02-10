library(GEOquery)

# Load de GEO

gset <- getGEO("GSE13139", GSEMatrix =TRUE, getGPL=FALSE)
if (length(gset) > 1) idx <- grep("GPL570", attr(gset, "names")) else idx <- 1
gset <- gset[[idx]]

# Para ver la matriz de cuentas
ex <- exprs(gset)

# Para ver los datos de fenotipos

pheno <- phenoData(gset)

detalles_array <- attributes(gset)

# esto es para ver con que anotar los genes
annotation(gset)

# se necesita el paquete BiocManager::install("hgu133plus2.db")
library("hgu133plus2.db")

# aqui esta el manual para hacer conversiones con ENTREZ ID o Simbolo del gen
# https://bioconductor.org/packages/release/data/annotation/manuals/hgu133plus2.db/man/hgu133plus2.db.pdf

#el objeto "ex" contiene la matriz de cuentas. Cada renglon es un gen pero con ID del array.
# y cada columna es una condicion o muestra distinta.




fData(gset)$Gene.Symbol[1:10]

# se llena con la anotacion
anotaciones <- fData(gset)

