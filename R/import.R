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
# hgu133plus2SYMBOL Map between Manufacturer Identifiers and Gene Symbols
## select() interface:
## Objects in this package can be accessed using the select() interface
## from the AnnotationDbi package. See ?select for details.
## Bimap interface:
x <- hgu133plus2SYMBOL
# Get the probe identifiers that are mapped to a gene symbol
mapped_probes <- mappedkeys(x)
# Convert to a list
xx <- as.list(x[mapped_probes][1:300])
if(length(xx) > 0) {
  # Get the SYMBOL for the first five probes
  xx[1:5]
  # Get the first one
  xx[[1]]
}

# aqui esta el manual para hacer conversiones con ENTREZ ID o Simbolo del gen
# https://bioconductor.org/packages/release/data/annotation/manuals/hgu133plus2.db/man/hgu133plus2.db.pdf

# el objeto "ex" contiene la matriz de cuentas. Cada renglon es un gen pero con ID del array.
# y cada columna es una condicion o muestra distinta.

# Estas anotaciones se colocan en fData(gset)



