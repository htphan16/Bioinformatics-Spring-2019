data <- read.table('Phylo2012subsampled.shared.txt', header=TRUE, sep='\t')
data

row.names(phylotypes) <- data$Group
phylotypes <- as.matrix(data[,4:870])
phylotypes
phylotypesREL <- phylotypes
for (i in 1:867) {
  phylotypesREL[,i] = phylotypes[,i]/sum(phylotypes[,i])
}
phylotypesREL

# par(mfrow=c(2,1))
library(vegan)
phylotypesREL.dist <- vegdist(phylotypesREL, method='bray')
phylotypesREL.dist
phylotypesREL.pcoa <- cmdscale(phylotypesREL.dist)
plot(phylotypesREL.pcoa[,1], phylotypesREL.pcoa[,2], cex=0.1)
text(phylotypesREL.pcoa[,1], phylotypesREL.pcoa[,2], row.names(phylotypesREL), cex=0.5)
phylotypesREL.clust <- hclust(phylotypesREL.dist)
plot(phylotypesREL.clust)

