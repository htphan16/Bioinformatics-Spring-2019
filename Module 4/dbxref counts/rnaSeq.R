library(edgeR)
library(ggplot2)
library(Rmisc)
library(dplyr)
#declare your files so you can import them at once.
files = dir(pattern="*dbxref.count")

#import the reads into a DGE (differential gene expression) object for use in edgeR
table=readDGE(files)
dim(table)
str(table)

#get rid of the meta tags (unfiltered reads, etc.) that are at the end of the table
MetaTags = grep("^__", rownames(table))
table=table[-MetaTags,]
dim(table)

#import the metadata downloaded from the SRA
#this can be obtained in the same place you originally downloaded the accession numbers
#in the NCBI SRA.  Instead of downloading the accession list you ask for the run table, 
#for all 32 libraries.
#note that as written, the command below will look for the file in your current #directory.
runtable = read.table(file="SraRunTable.txt", sep="\t", header=TRUE) 
colnames(runtable[,c(12:14, 18:19, 20:22)])
Groups = runtable[,c(12:14, 18:19, 20:22)]

#filter out low read samples.  Since the smallest grouping (i.e., level of replication  
#is 6, we are getting rid of genes that don't have at least 1 CPM in at least 6 #samples.
keep = rowSums(cpm(table)>1) >=6
table = table[keep,]
dim(table)

#apply TMM normalization
table = calcNormFactors(table)

#make a principal coordinates graph
x <- plotMDS(table)

#to make this better and label things, it is best to bring out the data for use in #ggplot
#the data for the mds was saved within the DGE list and can be renamed as its own #object.
xy = x$cmdscale.out

#now change this xy object into a data.frame...it was a matrix by default
xy = as.data.frame(xy)

#this new table of coordinates can be modified so that the column names mean something 
#and the labels are all part of the same table.
names(xy) = c("MDS_1", "MDS_2")
#before merging you need to make sure your df's are in the same order
#they are not, so sort Groups by Run
Groups2 = Groups[order(Groups$Run),]
xy = cbind(xy, Groups2)
mdsplot = ggplot(data=xy, aes(x=MDS_1, y=MDS_2, color=strain, label=label, pch=phenotype))+geom_point(size=4)+geom_text(nudge_x=.1, color="black", check_overlap=TRUE)+xlab("MDS 1")+ylab("MDS 2")+scale_fill_discrete(name="Population")+guides(fill=guide_legend(title="Population"))+theme(legend.position=c(.7,0.2))
mdsplot

#estimate dispersions, this is for statistical purposes (think of it as the variance #for all and the variance for each gene).  
table=estimateCommonDisp(table)
table=estimateTagwiseDisp(table)

table$samples$group <- Groups2$phenotype

#do a pairwise test
de = exactTest(table, pair=c("guinea pig-preferring", "human-preferring"))
#summarize the results...this just shows how many genes are up or down regulated
#by default this corrects for false discovery (FDR)
summary(decideTestsDGE(de))

#what the above shows is that there are 618 genes up-regulated in human-preferring and
#944 in guinea pig preferring.
#But we are using the whole dataset.  Let's subset it and then repeat.

#here we are subsetting to only include the first 16 libraries, i.e., no F2s
#note that the normalizations and calculated dispersions stay with this object and #don't need to be recalculated.
table2=table[,1:16]
table$samples$group
table$samples
de2 = exactTest(table2, pair=c("guinea pig-preferring", "human-preferring"))
summary(decideTestsDGE(de2))

table3=table[,17:32]

de3 = exactTest(table3, pair=c("guinea pig-preferring", "human-preferring"))
summary(decideTestsDGE(de3))
#for simplicity we will ask for a report of the top 100
topTags(de2, n=100)

topTags1 = topTags(de2, n=10561)
write.table(topTags1, file="topTags1.txt")
topTags2 = topTags(de3, n=10561)
write.table(topTags2, file="topTags2.txt")
#another useful visualization for these data is a smear plot.  This plots the 
#level of expression against the fold change difference of your treatments.
#typically, highly expressed genes tend not to be too different between treatments
#so the differentially expressed, very different, gene expression patterns 
#are of lesser expressed genes.  This then creates a pattern of decreasing 
#variance in fold change with increasing expression level.
de2_decide = decideTestsDGE(de2)
#differentiates the differentially expressed genes
detags = rownames(table)[as.logical(de2_decide)] 
#converts those diff expressed genes with 1 or 0
plotSmear(de2, de.tags=detags) 
#the plotting function, the de.tags are those that are diff expressed, by default red
abline(h=c(-1, 1), col="blue")
#adds lines at +/-1 (i.e., 2 fold difference in expression since it is log2)

#lastly, if you want to do a heatmap, which can look pretty cool, here are some basics
topde2 = topTags(de2, n=100)
detags2 = rownames(topde2)
cpm_de2 = cpm(table2, log=TRUE)[detags2,]
cpm_de2
hm1 <- heatmap(cpm_de2, labRow=table2$group, labCol=Groups2$phenotype)
#this can be further modified as wanted

topde3 = topTags(de3, n=100)
detags3 = rownames(topde3)
cpm_de3 = cpm(table3, log=TRUE)[detags3,]
hm2 <- heatmap(cpm_de3, labRow=table3$group, labCol=Groups2$phenotype)

# Choose Gr2 (AAEL002167) - cpA neuron as CO2 receptor 
library(gridExtra)
topTags1$table[3162,1]
topTags2$table[5489,1]
gene <- c('AAEL002167-RA', 'mean')
logFC <- c(topTags1$table[3162,1], mean(topTags1$table$logFC))
mean(topTags1$table$logFC)
data1 <- data.frame(gene, logFC)
a <- ggplot(data1, aes(x=gene, y=logFC, fill=gene)) + geom_bar(position=position_dodge(), stat='identity') + ylim(0, 0.8)
gene <- c('AAEL002167-RA', 'mean')
mean(topTags2$table$logFC)
logFC <- c(topTags2$table[5489,1], mean(topTags2$table$logFC))
data2 <- data.frame(gene, logFC)
b <- ggplot(data2, aes(x=gene, y=logFC, fill=gene)) + geom_bar(position=position_dodge(), stat='identity') + ylim(0, 0.8)
grid.arrange(a, b, nrow = 1)

gene <- c('AAEL002167-RA', 'mean', 'AAEL002167-RA', 'mean')
logFC <- c(topTags1$table[3162,1], mean(topTags1$table$logFC),topTags2$table[5489,1], mean(topTags2$table$logFC))
pop <- c('Non-hybrid', 'Non-hybrid', 'Hybrid', 'Hybrid')
data3 <- data.frame(gene, logFC, pop)
data3$logFC <- as.numeric(data3$logFC)
class(data3$logFC)
ggplot(data3, aes(x=pop, y=logFC, fill=gene)) + geom_bar(position=position_dodge(), stat='identity') + ylim(0, 0.8) + theme(legend.justification=c(1,0), legend.position=c(0.95,0.8))

detags2 = rownames(topTags1)
cpm_de2 = cpm(table2, log=TRUE)[detags2,]
cpm_de2 = cpm(table2, log=TRUE)[detags2,]
cpm_de2[3162,]
hm_p <- heatmap(cpm_de2[3162:3163,],labCol=Groups2$strain)
#this can be further modified as wanted

logCPM <- c(cpm_de2[3162,3],cpm_de2[3162,4],cpm_de2[3162,5], cpm_de2[3162,6],cpm_de2[3162,7],cpm_de2[3162,8],cpm_de2[3162,9], cpm_de2[3162,10],cpm_de2[3162,11],cpm_de2[3162,12], cpm_de2[3162,13], cpm_de2[3162,14],cpm_de2[3162,15],cpm_de2[3162,16])
strain <- c('forest','forest','forest','forest','forest','forest','domestic','domestic','domestic','domestic','domestic','domestic','forest','forest')
data4 <- data.frame(logCPM, strain)
ggplot(data4, aes(x=strain, y=logCPM, fill=strain)) + geom_boxplot() + theme(legend.justification=c(1,0), legend.position=c(0.9,0.1))

aov <- aov(data=data4, logCPM ~ strain)
summary(aov)

