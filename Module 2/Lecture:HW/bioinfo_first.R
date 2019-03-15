# Get current working directory
getwd()
# Set new working directory
# setwd('~/Desktop/')

data <- as.matrix(read.table('Table1.txt', header=TRUE, sep='\t', row.names = 1))
data
dim(data)
oturichness <- rowSums(data)
oturichness
rowSums(data[1:2,])
colSums(data)

# Presence-absence of OTUs in each sample
dataPA <- (data>0)*1
dataPA
(data>0)
TRUE*1
# species richness
rich <- colSums(dataPA)
rich
# relative abundance
dataREL <- data
dataREL[,1] = data[,1]/sum(data[,1])
dataREL[,2] = data[,2]/sum(data[,2])
dataREL[,3] = data[,3]/sum(data[,3])
dataREL[,4] = data[,4]/sum(data[,4])
dataREL

dataREL2 <- data
for (i in 1:4) {
  dataREL2[,i] <- data[,i]/sum(data[,i]) 
}
dataREL2
colSums(dataREL2)
# transpose matrix
t(dataREL2)

# Distance among samples, and among OTUs
library(vegan)
# First parameter must be the rows of data among which we calculate distance
# Distance among samples in terms of presence-absence
samplePA.dist <- vegdist(t(dataPA), method='jaccard')
samplePA.dist
# Distance among OTUs in terms of presence-absence
otuPA.dist <- vegdist(dataPA, method='jaccard')
otuPA.dist

# Distance among samples in terms of relative abundance
sampleREL.dist <- vegdist(t(dataREL), method='bray')
sampleREL.dist

# Distance among OTUs in terms of relative abundance
otuREL.dist <- vegdist(dataREL, method='bray')
otuREL.dist

# Principal coordinates analysis
samplePA.pcoa <- cmdscale(samplePA.dist)
samplePA.pcoa

sampleREL.pcoa <- cmdscale(sampleREL.dist)
sampleREL.pcoa

samplePA.clust <- hclust(samplePA.dist)
samplePA.clust

sampleREL.clust <- hclust(sampleREL.dist)
sampleREL.clust

plot(samplePA.pcoa[,1], samplePA.pcoa[,2])
plot(sampleREL.pcoa[,1], sampleREL.pcoa[,2])

# quartz()
par(mfrow=c(2,2))
plot(samplePA.pcoa[,1], samplePA.pcoa[,2], cex=0)
text(samplePA.pcoa[,1], samplePA.pcoa[,2], seq(1,4), cex=1)
plot(sampleREL.pcoa[,1], sampleREL.pcoa[,2], cex=0)
text(sampleREL.pcoa[,1], sampleREL.pcoa[,2], seq(1,4), cex=1)
plot(samplePA.clust)
plot(sampleREL.clust)

heatmap(dataREL, scale='none', labCol=c('S1', 'S2', 'S3', 'S4'))


