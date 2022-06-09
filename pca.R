# very preliminary script for PCA analysis

library(SNPRelate)
# library(SeqArray) # not installed on server
library("gdsfmt")

vcf.fn <- system.file("extdata", "sequence.vcf", package="SNPRelate")
# Reformat
snpgdsVCF2GDS(vcf.fn, "test.gds", method="biallelic.only")
# Summary
snpgdsSummary("test.gds")


# open a GDS file
# genofile <- seqOpen("test.gds") # cannot find function
# genofile <- read.gdsn("test.gds") # not working either

# genofile <- snpgdsOpen("test.gds") this kind of works

(genofile <- snpgdsOpen(snpgdsExampleFileName()))

# Run PCA
pca <- snpgdsPCA(genofile)
pca <- snpgdsPCA(genofile, snp.id=snpset.id, num.thread=2)

# make a data.frame
tab <- data.frame(sample.id = pca$sample.id,
                  EV1 = pca$eigenvect[,1],    # the first eigenvector
                  EV2 = pca$eigenvect[,2],    # the second eigenvector
                  stringsAsFactors = FALSE)
head(tab)

# Draw
plot(tab$EV2, tab$EV1, xlab="eigenvector 2", ylab="eigenvector 1")



# prefix <- file.path("hi", "vcf_stats")
# paste("vcf-stats", file.path("/srv/gstore/projects", "get"), "-p", prefix)
# 



