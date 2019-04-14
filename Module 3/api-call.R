library(matR)
req <- biomRequest('mgm4552597.3 mgm4552598.3 mgm4552599.3 mgm4552600.3 mgm4552601.3 mgm4552602.3 mgm4552603.3 mgm4552604.3 mgm4552605.3 mgm4552606.3 mgm4552607.3 mgm4552608.3 mgm4552609.3 mgm4552610.3 mgm4552611.3 mgm4552612.3 mgm4552613.3 mgm4552614.3 mgm4552615.3 mgm4552616.3', request='function', group_level='level2')
req1 <- biomRequest('mgm4552617.3 mgm4552618.3 mgm4552619.3 mgm4552620.3 mgm4552621.3 mgm4552622.3 mgm4552623.3 mgm4552624.3 mgm4552625.3 mgm4552626.3 mgm4552627.3 mgm4552628.3 mgm4552629.3 mgm4552630.3 mgm4552631.3 mgm4552632.3 mgm4552633.3 mgm4552634.3 mgm4552635.3 mgm4552636.3', request='function', group_level='level2')
req2 <- biomRequest('mgm4552597.3 mgm4552598.3 mgm4552599.3 mgm4552600.3 mgm4552601.3 mgm4552602.3 mgm4552603.3 mgm4552604.3 mgm4552605.3 mgm4552606.3 mgm4552607.3 mgm4552608.3 mgm4552609.3 mgm4552610.3 mgm4552611.3 mgm4552612.3 mgm4552613.3 mgm4552614.3 mgm4552615.3 mgm4552616.3', request='function', group_level='level1')
req3 <- biomRequest('mgm4552617.3 mgm4552618.3 mgm4552619.3 mgm4552620.3 mgm4552621.3 mgm4552622.3 mgm4552623.3 mgm4552624.3 mgm4552625.3 mgm4552626.3 mgm4552627.3 mgm4552628.3 mgm4552629.3 mgm4552630.3 mgm4552631.3 mgm4552632.3 mgm4552633.3 mgm4552634.3 mgm4552635.3 mgm4552636.3', request='function', group_level='level1')
data <- req$data
data1 <- req1$data
data2 <- req2$data
data3 <- req3$data
level1 <- cbind(data2, data3)
level2 <- cbind(data, data1)
file1 <- write.table(level1, file='function_level1.txt')
file2 <- write.table(level2, file='function_level2.txt')

lv1 <- as.data.frame(t(level1))
lv2 <- as.data.frame(t(level2))
library(xlsx)
file <- read.xlsx('20122013BasicFieldData.xlsx', sheetName = "Sheet1")
