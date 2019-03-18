library(ggplot2)
chemdata <- as.matrix(read.table('SoilChemData2014_reduced.txt', header=TRUE))

phyla <- read.table('fake.trim.contigs.good.unique.good.filter.unique.precluster.pick.pds.wang.tax.summary', header=TRUE, sep='\t')
phyla
phyla_taxlevel2 <- phyla[which(phyla$taxlevel == '2'),]

a <- phyla_taxlevel2[which(phyla_taxlevel2$taxon == 'Actinobacteria' | phyla_taxlevel2$taxon == 'Proteobacteria'),][,6:25]
rownames(a) <- c('Actinobacteria', 'Proteobacteria')
a <- as.data.frame(t(a))
a[['Sample']] <- c('C1', 'C10', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9', 'F1', 'F10', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9')
b <- merge(a, chemdata, by='Sample')

