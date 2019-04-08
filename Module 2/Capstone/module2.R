#install.packages('ggplot2')
#install.packages('Rmisc')
#install.packages('gridExtra')

library(ggplot2)
library(Rmisc)
library(gridExtra)
chemdata <- as.matrix(read.table('SoilChemData2014_reduced.txt', header=TRUE))

phyla <- read.table('fake.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.opti_mcc.0.03.cons.tax.summary', header=TRUE, sep='\t')
#phyla
phyla_taxlevel2 <- phyla[which(phyla$taxlevel == '2'),]

# ABUNDANCE
a <- phyla_taxlevel2[which(phyla_taxlevel2$taxon == 'Actinobacteria' | phyla_taxlevel2$taxon == 'Proteobacteria' | phyla_taxlevel2$taxon == 'Firmicutes' | phyla_taxlevel2$taxon == 'Acidobacteria'),][,6:25]
rownames(a) <- c('Actinobacteria', 'Proteobacteria', 'Firmicutes', 'Acidobacteria')
a <- as.data.frame(t(a))
a[['Sample']] <- c('C1', 'C10', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9', 'F1', 'F10', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9')
b <- merge(a, chemdata, by='Sample')
field <- c(rep('Crop', 10), rep('Forest', 10))
field
b <- cbind(b, field)
b[,2] <- b[,2]/sum(b[,2])
b[,3] <- b[,3]/sum(b[,3])
b[,4] <- b[,4]/sum(b[,4])
b[,5] <- b[,5]/sum(b[,5])

b[,9] <- as.numeric(as.character(b[,9]))

# Actinobacteria against Mg_ppm (Crop)
summary(lm(b[1:10,9]~b[1:10,2]))
# Proteobacteria against Mg_ppm (Crop)
summary(lm(b[1:10,9]~b[1:10,3]))
# Firmicutes against Mg_ppm (Crop)
summary(lm(b[1:10,9]~b[1:10,4]))
# Acidobacteria against Mg_ppm (Crop)
summary(lm(b[1:10,9]~b[1:10,5]))

# Actinobacteria against Mg_ppm (Forest)
summary(lm(b[11:20,9]~b[11:20,2]))
# Proteobacteria against Mg_ppm (Forest)
summary(lm(b[11:20,9]~b[11:20,3]))
# Firmicutes against Mg_ppm (Forest)
summary(lm(b[11:20,9]~b[11:20,4]))
# Acidobacteria against Mg_ppm (Forest)
summary(lm(b[11:20,9]~b[11:20,5]))

# Actinobacteria against Mg_ppm (All)
summary(lm(b[,9] ~ b[,2]))
# Proteobacteria against Mg_ppm (All)
summary(lm(b[,9] ~ b[,3]))
# Firmicutes against Mg_ppm (All)
summary(lm(b[,9] ~ b[,4]))
# Acidobacteria against Mg_ppm (All)
summary(lm(b[,9] ~ b[,5]))

p1 <- ggplot(b, aes(Mg_ppm, Actinobacteria, color=field)) + geom_point() + stat_smooth(method = "lm", col = "black")
p2 <- ggplot(b, aes(Mg_ppm, Proteobacteria, color=field)) + geom_point() + stat_smooth(method = "lm", col = "black")
p3 <- ggplot(b, aes(Mg_ppm, Firmicutes, color=field)) + geom_point() + stat_smooth(method = "lm", col = "black")
p4 <- ggplot(b, aes(Mg_ppm, Acidobacteria, color=field)) + geom_point() + stat_smooth(method = "lm", col = "black")
grid.arrange(p1, p2, p3, p4, nrow = 2)

#t.test(b[1:10,2],b[11:20,2])
#t.test(b[1:10,3],b[11:20,3])
#t.test(b[1:10,4],b[11:20,4])
#t.test(b[1:10,5],b[11:20,5])

groups <- read.table('fake.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.opti_mcc.0.03.subsample.groups.summary', header=TRUE, sep='\t')
#summary
groups2 <- cbind(summary, field)
#summary2
groups_summary <- summarySE(groups2, measurevar ='sobs', groupvars = 'field')
groups_summary

(ggplot(groups_summary, aes(y=sobs, x=field, fill=field))+geom_bar(position=position_dodge(), stat='identity')
+geom_errorbar(aes(ymin=sobs-ci, ymax=sobs+ci), width=.2, position=position_dodge(.9)))
aov <- aov(data=groups2, sobs ~ field)
summary(aov)

b_summary <- summarySE(b, measurevar ='Mg_ppm', groupvars = 'field')
b_summary
(ggplot(b_summary, aes(y=Mg_ppm, x=field, fill=field))+geom_bar(position=position_dodge(), stat='identity')
  +geom_errorbar(aes(ymin=Mg_ppm-ci, ymax=Mg_ppm+ci), width=.2, position=position_dodge(.9)))
aov <- aov(data=b, Mg_ppm ~ field)
summary(aov)

b_summary2 <- summarySE(b, measurevar ='Actinobacteria', groupvars = 'field')
b_summary2
q1 <- (ggplot(b_summary2, aes(y=Actinobacteria, x=field, fill=field))+geom_bar(position=position_dodge(), stat='identity')
  +geom_errorbar(aes(ymin=Actinobacteria-ci, ymax=Actinobacteria+ci), width=.2, position=position_dodge(.9)))
aov <- aov(data=b, Actinobacteria ~ field)
summary(aov)

b_summary3 <- summarySE(b, measurevar ='Proteobacteria', groupvars = 'field')
b_summary3
q2 <- (ggplot(b_summary3, aes(y=Proteobacteria, x=field, fill=field))+geom_bar(position=position_dodge(), stat='identity')
  +geom_errorbar(aes(ymin=Proteobacteria-ci, ymax=Proteobacteria+ci), width=.2, position=position_dodge(.9)))
aov <- aov(data=b, Proteobacteria ~ field)
summary(aov)

b_summary4 <- summarySE(b, measurevar ='Firmicutes', groupvars = 'field')
b_summary4
q3 <- (ggplot(b_summary4, aes(y=Firmicutes, x=field, fill=field))+geom_bar(position=position_dodge(), stat='identity')
  +geom_errorbar(aes(ymin=Firmicutes-ci, ymax=Firmicutes+ci), width=.2, position=position_dodge(.9)))
aov <- aov(data=b, Firmicutes ~ field)
summary(aov)

b_summary5 <- summarySE(b, measurevar ='Acidobacteria', groupvars = 'field')
b_summary5
q4 <- (ggplot(b_summary5, aes(y=Acidobacteria, x=field, fill=field))+geom_bar(position=position_dodge(), stat='identity')
  +geom_errorbar(aes(ymin=Acidobacteria-ci, ymax=Acidobacteria+ci), width=.2, position=position_dodge(.3)))
aov <- aov(data=b, Acidobacteria ~ field)
summary(aov)

grid.arrange(q1, q2, q3, q4, nrow = 2)

# RICHNESS
# Actinobacteria richness
phyla_actino <- phyla[111:284,]
phyla_actino2 <- phyla_actino[(phyla_actino$taxlevel == 6),]
phyla_actinoPA <- (phyla_actino2[,6:25]>0)*1
richness_actino <- colSums(phyla_actinoPA)
richness_actino <- as.data.frame(richness_actino)
richness_actino[['Sample']] <- c('C1', 'C10', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9', 'F1', 'F10', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9')
colnames(richness_actino) <- c('Actinobacteria', 'Sample')
actino <- merge(richness_actino, chemdata, by='Sample')

p5 <- ggplot(actino, aes(Mg_ppm, Actinobacteria, color=field)) + geom_point() + stat_smooth(method = "lm", col = "black")

actino[,6] <- as.numeric(as.character(actino[,6]))

# Actinobacteria richness against Mg_ppm (Crop)
summary(lm(actino[1:10,6]~actino[1:10,2]))
# Actinobacteria richness against Mg_ppm (Forest)
summary(lm(actino[11:20,6]~actino[11:20,2]))
# Actinobacteria richness against Mg_ppm (All)
summary(lm(actino[,6]~actino[,2]))

mg_summary <- summarySE(b, measurevar ='Mg_ppm', groupvars = 'field')
mg_summary
(ggplot(mg_summary, aes(y=Mg_ppm, x=field, fill=field))+geom_bar(position=position_dodge(), stat='identity')
  +geom_errorbar(aes(ymin=Mg_ppm-ci, ymax=Mg_ppm+ci), width=.2, position=position_dodge(.9)))
aov <- aov(data=b, Mg_ppm ~ field)
summary(aov)

actino_summary2 <- summarySE(actino, measurevar ='Actinobacteria', groupvars = 'field')
actino_summary2
q5 <- (ggplot(actino_summary2, aes(y=Actinobacteria, x=field, fill=field))+geom_bar(position=position_dodge(), stat='identity')
  +geom_errorbar(aes(ymin=Actinobacteria-ci, ymax=Actinobacteria+ci), width=.2, position=position_dodge(.9)))
aov <- aov(data=actino, Actinobacteria ~ field)
summary(aov)

# Proteobacteria richness
phyla_proteo <- phyla[498:874,]
phyla_proteo2 <- phyla_proteo[(phyla_proteo$taxlevel == 6),]
phyla_proteoPA <- (phyla_proteo2[,6:25]>0)*1
richness_proteo <- colSums(phyla_proteoPA)
richness_proteo <- as.data.frame(richness_proteo)
richness_proteo[['Sample']] <- c('C1', 'C10', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9', 'F1', 'F10', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9')
colnames(richness_proteo) <- c('Proteobacteria', 'Sample')
proteo <- merge(richness_proteo, chemdata, by='Sample')

p6 <- ggplot(proteo, aes(Mg_ppm, Proteobacteria, color=field)) + geom_point() + stat_smooth(method = "lm", col = "black")

proteo[,6] <- as.numeric(as.character(proteo[,6]))

# Proteobacteria richness against Mg_ppm (Crop)
summary(lm(proteo[1:10,6]~proteo[1:10,2]))
# Proteobacteria richness against Mg_ppm (Forest)
summary(lm(proteo[11:20,6]~proteo[11:20,2]))
# Proteobacteria richness against Mg_ppm (All)
summary(lm(proteo[,6]~proteo[,2]))

proteo_summary2 <- summarySE(proteo, measurevar ='Proteobacteria', groupvars = 'field')
proteo_summary2
q6 <- (ggplot(proteo_summary2, aes(y=Proteobacteria, x=field, fill=field))+geom_bar(position=position_dodge(), stat='identity')
  +geom_errorbar(aes(ymin=Proteobacteria-ci, ymax=Proteobacteria+ci), width=.2, position=position_dodge(.9)))
aov <- aov(data=proteo, Proteobacteria ~ field)
summary(aov)

# Firmicutes richness
phyla_firm <- phyla[934:1082,]
phyla_firm2 <- phyla_firm[(phyla_firm$taxlevel == 6),]
phyla_firmPA <- (phyla_firm2[,6:25]>0)*1
richness_firm <- colSums(phyla_firmPA)
richness_firm <- as.data.frame(richness_firm)
richness_firm[['Sample']] <- c('C1', 'C10', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9', 'F1', 'F10', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9')
colnames(richness_firm) <- c('Firmicutes', 'Sample')
firm <- merge(richness_firm, chemdata, by='Sample')

p7 <- ggplot(firm, aes(Mg_ppm, Firmicutes, color=field)) + geom_point() + stat_smooth(method = "lm", col = "black")
firm[,6] <- as.numeric(as.character(firm[,6]))

# Firmicutes richness against Mg_ppm (Crop)
summary(lm(firm[1:10,6]~firm[1:10,2]))
# Firmicutes richness against Mg_ppm (Forest)
summary(lm(firm[11:20,6]~firm[11:20,2]))
# Firmicutes richness against Mg_ppm (All)
summary(lm(firm[,6]~firm[,2]))

firm_summary2 <- summarySE(firm, measurevar ='Firmicutes', groupvars = 'field')
firm_summary2
q7 <- (ggplot(firm_summary2, aes(y=Firmicutes, x=field, fill=field))+geom_bar(position=position_dodge(), stat='identity')
  +geom_errorbar(aes(ymin=Firmicutes-ci, ymax=Firmicutes+ci), width=.2, position=position_dodge(.9)))
aov <- aov(data=firm, Firmicutes ~ field)
summary(aov)

# Acidobacteria richness
phyla_acido <- phyla[3:110,]
phyla_acido2 <- phyla_acido[(phyla_acido$taxlevel == 6),]
phyla_acidoPA <- (phyla_acido2[,6:25]>0)*1
richness_acido <- colSums(phyla_acidoPA)
richness_acido <- as.data.frame(richness_acido)
richness_acido[['Sample']] <- c('C1', 'C10', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9', 'F1', 'F10', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9')
colnames(richness_acido) <- c('Acidobacteria', 'Sample')
acido <- merge(richness_acido, chemdata, by='Sample')

p8 <- ggplot(acido, aes(Mg_ppm, Acidobacteria, color=field)) + geom_point() + stat_smooth(method = "lm", col = "black")
grid.arrange(p5, p6, p7, p8, nrow = 2)
acido[,6] <- as.numeric(as.character(acido[,6]))

# Acidobacteria richness against Mg_ppm (Crop)
summary(lm(acido[1:10,6]~acido[1:10,2]))
# Acidobacteria richness against Mg_ppm (Forest)
summary(lm(acido[11:20,6]~acido[11:20,2]))
# Acidobacteria richness against Mg_ppm (All)
summary(lm(acido[,6]~acido[,2]))

acido_summary2 <- summarySE(acido, measurevar ='Acidobacteria', groupvars = 'field')
acido_summary2
q8 <- (ggplot(acido_summary2, aes(y=Acidobacteria, x=field, fill=field))+geom_bar(position=position_dodge(), stat='identity')
  +geom_errorbar(aes(ymin=Acidobacteria-ci, ymax=Acidobacteria+ci), width=.2, position=position_dodge(.9)))
aov <- aov(data=acido, Acidobacteria ~ field)
summary(aov)
grid.arrange(q5, q6, q7, q8, nrow = 2)
#library(data.table)
#phylotypes <- fread('fake.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.opti_mcc.0.03.subsample.shared', header=TRUE, sep='\t')
#phylotypes

