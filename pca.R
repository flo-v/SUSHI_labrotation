library(ggplot2)
library(ggrepel)
library(SNPRelate)
# library(SeqArray) # not installed on server
library("gdsfmt")
rm(list=ls())

snp_pa <- "~/ragi_highcov_sa0001_1k.vcf.gz"
# Reformat
snpgdsVCF2GDS(snp_pa, "snp.gds", method="biallelic.only")
# Summary
snpgdsSummary("snp.gds")


# open a GDS file
# genofile <- seqOpen("test.gds") # cannot find function
# genofile <- read.gdsn("test.gds") # not working either

snp <- snpgdsOpen("snp.gds")


# Run PCA
# algorithm, num.thread, bayesian
pca <- snpgdsPCA(snp, autosome.only=F, remove.monosnp=F)

# those two vecotrs should be the same, approximately true
(pca$eigenval) / 42
pca$varprop

cumsum(pca$varprop) # would use first 4 PCs

# make a data.frame
df <- data.frame(sample.id = pca$sample.id,
                  EV1 = pca$eigenvect[,1],    # the first eigenvector
                  EV2 = pca$eigenvect[,2],    # the second eigenvector
                  EV3 = pca$eigenvect[,3],
                  stringsAsFactors = FALSE)
head(df)

# Draw
ggplot(df, aes(x = EV1, y = EV2, colour = EV3)) +
  geom_point(alpha=0.5) +
  geom_text(label=df$sample.id, size = 1, check_overlap=T,
            nudge_y = 0.05) +
  theme_bw()


ggplot(df, aes(x = EV1, y = EV2, label = sample.id)) +
  geom_point(alpha=0.5, colour="blue", size = 1) +
  geom_text_repel(size = 1, min.segment.length = 0, box.padding = 0.7,
                  max.overlaps = 100,
                  segment.size= 0.1,
                  segment.linetype = "dashed",
                  segment.alpha = 0.5) +
  theme_bw()
