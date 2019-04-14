filelv2 = read.table('function_level2.txt')
filelv1 = read.table('function_level1.txt')

flip <- t(filelv2)
flip1 <- t(filelv1)

field <- c('Soy', 'Corn','Soy', 'Corn','Soy', 'Corn','Soy', 'Corn','Soy', 'Corn','Corn','Soy','Soy', 'Corn','Soy','Corn','Soy','Corn','Soy','Corn','Soy','Corn','Corn','Corn','Soy','Corn','Soy','Corn','Soy','Soy','Corn', 'Forest','Forest','Corn','Soy','Soy','Corn','Soy','Corn','Soy')
till <- c('No','Yes','Yes','Yes','Yes','Yes','Yes','Yes','Yes','Yes','No','Yes','No','No','No','No','No','No','No','No','Yes','Yes','Yes','Yes','Yes','Yes','Yes','Yes','Yes','No','Yes','','','No','No','No','No','No','No','No')
Year <- c(rep('2012', 20), rep('2013', 20))
Number <- c('10','11','12','13','14','15','16','17','18','19','1','20','2','3','4','5','6','7','8','9','11','12','13','14','15','16','17','18','19','1','20','23','24','2','3','5','6','7','8','9')
lv1 <- cbind(flip1,field,till,Year,Number)
lv2 <- cbind(flip,field,till,Year,Number)

fielddata <- read.csv("20122013BasicFieldData.csv", header = TRUE)
total <- merge(fielddata,lv1, by=c("Year","Number"))

library(dplyr)

#Correlation between Magnesium concentration between cellular division and magnesium concentration at level 1 
summary(lm(as.numeric(as.character(total[which(total$till == "Yes"),28])) ~ as.numeric(as.character(total[which(total$till == "Yes"),14]))))
summary(lm(as.numeric(as.character(total[which(total$till == "No"),28])) ~ as.numeric(as.character(total[which(total$till == "No"),14]))))
summary(lm(as.numeric(as.character(total[which(total$Crop == "Corn"),28])) ~ as.numeric(as.character(total[which(total$Crop == "Corn"),14]))))
summary(lm(as.numeric(as.character(total[which(total$Crop == "Soy"),28])) ~ as.numeric(as.character(total[which(total$Crop == "Soy"),14]))))

summary(lm(as.numeric(as.character(total[,28])) ~ as.numeric(as.character(total[,14]))))

#Level 2 
total2 <- merge(fielddata, lv2, by=c("Year","Number"))
summary(lm(as.numeric(as.character(total2[which(total2$Till == "Yes"),93])) ~ as.numeric(as.character(total2[which(total2$Till == "Yes"),14]))))
summary(lm(as.numeric(as.character(total2[which(total2$Till == "No"),93])) ~ as.numeric(as.character(total2[which(total2$Till == "No"),14]))))
summary(lm(as.numeric(as.character(total2[which(total2$Crop == "Corn"),93])) ~ as.numeric(as.character(total2[which(total2$Crop == "Corn"),14]))))
summary(lm(as.numeric(as.character(total2[which(total2$Crop == "Soy"),93])) ~ as.numeric(as.character(total2[which(total2$Crop == "Soy"),14]))))

summary(lm(as.numeric(as.character(total2[,93])) ~ as.numeric(as.character(total2[,14]))))

#Ggplot Graph for Level 1 
install.packages("ggplot2")
library(ggplot2)
library(gridExtra)

total2 <- merge(fielddata, lv2, by=c("Year","Number"))
summary(lm(as.numeric(as.character(total2[which(total2$Till == "Yes"),93])) ~ as.numeric(as.character(total2[which(total2$Till == "Yes"),14]))+as.numeric(as.character(total2[which(total2$Till == "Yes"),13]))))
summary(lm(as.numeric(as.character(total2[which(total2$Till == "No"),93])) ~ as.numeric(as.character(total2[which(total2$Till == "No"),14]))+as.numeric(as.character(total2[which(total2$Till == "No"),13]))))
summary(lm(as.numeric(as.character(total2[which(total2$Crop == "Corn"),93])) ~ as.numeric(as.character(total2[which(total2$Crop == "Corn"),14]))+as.numeric(as.character(total2[which(total2$Crop == "Corn"),13]))))
summary(lm(as.numeric(as.character(total2[which(total2$Crop == "Soy"),93])) ~ as.numeric(as.character(total2[which(total2$Crop == "Soy"),14]))+as.numeric(as.character(total2[which(total2$Crop == "Soy"),13]))))

summary(lm(as.numeric(as.character(total2[,93])) ~ as.numeric(as.character(total2[,14]))+as.numeric(as.character(total2[,13]))))

p1 <- ggplot(total, aes(x = Mgppm, y = as.numeric(as.character(total$'Cell Division and Cell Cycle')), color = field, shape = till, size=2, alpha=.8))+geom_point() + ylab('Cell Cycle and Cell Division') + scale_color_manual(values=c("darkgoldenrod", "darkgreen"))

p2 <- ggplot(total2, aes(x = Mgppm, y = as.numeric(as.character(total2$'Pyruvate kinase associated cluster')), color = field, shape = till, size=2, alpha=.8))+geom_point() + ylab('Pyruvate kinase associated cluster') + scale_color_manual(values=c("darkgoldenrod", "darkgreen"))

grid.arrange(p1, p2, nrow = 1)
