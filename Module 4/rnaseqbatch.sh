#!/bin/bash
module load sratoolkit/2.8.2
fastq-dump --split-3 SRR1103950
fastq-dump --split-3 SRR1103952
fastq-dump --split-3 SRR1103953
fastq-dump --split-3 SRR1103954
fastq-dump --split-3 SRR1103955
fastq-dump --split-3 SRR1103956
fastq-dump --split-3 SRR1103957
fastq-dump --split-3 SRR1103958
fastq-dump --split-3 SRR1103959
fastq-dump --split-3 SRR1103960
fastq-dump --split-3 SRR1103961
fastq-dump --split-3 SRR1103962
fastq-dump --split-3 SRR1103963
fastq-dump --split-3 SRR1103964
fastq-dump --split-3 SRR1103965
fastq-dump --split-3 SRR1103966
fastq-dump --split-3 SRR1103967
fastq-dump --split-3 SRR1103968
fastq-dump --split-3 SRR1103969
fastq-dump --split-3 SRR1103970
fastq-dump --split-3 SRR1103971
fastq-dump --split-3 SRR1103972
fastq-dump --split-3 SRR1103973
fastq-dump --split-3 SRR1103974
fastq-dump --split-3 SRR1103975
fastq-dump --split-3 SRR1103976
fastq-dump --split-3 SRR1103977
fastq-dump --split-3 SRR1103978
fastq-dump --split-3 SRR1103979
fastq-dump --split-3 SRR1103980
fastq-dump --split-3 SRR1103981
fastq-dump --split-3 SRR1103982
curl -O ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/002/204/515/GCF_002204515.2_AaegL5.0/GCF_002204515.2_AaegL5.0_genomic.fna.gz
gunzip GCF_002204515.2_AaegL5.0_genomic.fna.gz
curl -O ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/002/204/515/GCF_002204515.2_AaegL5.0/GCF_002204515.2_AaegL5.0_genomic.gff.gz
gunzip GCF_002204515.2_AaegL5.0_genomic.gff.gz
module load bowtie/2.3.1
bowtie2-build -f GCF_002204515.2_AaegL5.0_genomic.fna Aaegypti_genome
module load tophat/2.1.1
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103950 Aaegypti_genome SRR1103950.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103952 Aaegypti_genome SRR1103952.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103953 Aaegypti_genome SRR1103953.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103954 Aaegypti_genome SRR1103954.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103955 Aaegypti_genome SRR1103955.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103956 Aaegypti_genome SRR1103956.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103957 Aaegypti_genome SRR1103957.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103958 Aaegypti_genome SRR1103958.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103959 Aaegypti_genome SRR1103959.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103960 Aaegypti_genome SRR1103960.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103961 Aaegypti_genome SRR1103961.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103962 Aaegypti_genome SRR1103962.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103963 Aaegypti_genome SRR1103963.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103964 Aaegypti_genome SRR1103964.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103965 Aaegypti_genome SRR1103965.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103966 Aaegypti_genome SRR1103966.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103967 Aaegypti_genome SRR1103967.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103968 Aaegypti_genome SRR1103968.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103969 Aaegypti_genome SRR1103969.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103970 Aaegypti_genome SRR1103970.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103971 Aaegypti_genome SRR1103971.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103972 Aaegypti_genome SRR1103972.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103973 Aaegypti_genome SRR1103973.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103974 Aaegypti_genome SRR1103974.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103975 Aaegypti_genome SRR1103975.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103976 Aaegypti_genome SRR1103976.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103977 Aaegypti_genome SRR1103977.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103978 Aaegypti_genome SRR1103978.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103979 Aaegypti_genome SRR1103979.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103980 Aaegypti_genome SRR1103980.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103981 Aaegypti_genome SRR1103981.fastq
tophat2 -G GCF_002204515.2_AaegL5.0_genomic.gff -o SRR1103982 Aaegypti_genome SRR1103982.fastq
module load samtools/1.4
samtools sort -n SRR1103950/accepted_hits.bam SRR1103950_sn
samtools view -o SRR1103950_sn.sam SRR1103950_sn.bam
samtools sort SRR1103950/accepted_hits.bam SRR1103950_s
samtools index SRR1103950_s.bam
samtools sort -n SRR1103952/accepted_hits.bam SRR1103952_sn
samtools view -o SRR1103952_sn.sam SRR1103952_sn.bam
samtools sort SRR1103952/accepted_hits.bam SRR1103952_s
samtools index SRR1103952_s.bam
samtools sort -n SRR1103953/accepted_hits.bam SRR1103953_sn
samtools view -o SRR1103953_sn.sam SRR1103953_sn.bam
samtools sort SRR1103953/accepted_hits.bam SRR1103953_s
samtools index SRR1103953_s.bam
samtools sort -n SRR1103954/accepted_hits.bam SRR1103954_sn
samtools view -o SRR1103954_sn.sam SRR1103954_sn.bam
samtools sort SRR1103954/accepted_hits.bam SRR1103954_s
samtools index SRR1103954_s.bam
samtools sort -n SRR1103955/accepted_hits.bam SRR1103955_sn
samtools view -o SRR1103955_sn.sam SRR1103955_sn.bam
samtools sort SRR1103955/accepted_hits.bam SRR1103955_s 
samtools index SRR1103955_s.bam
samtools sort -n SRR1103956/accepted_hits.bam SRR1103956_sn
samtools view -o SRR1103956_sn.sam SRR1103956_sn.bam
samtools sort SRR1103956/accepted_hits.bam SRR1103956_s 
samtools index SRR1103956_s.bam
samtools sort -n SRR1103957/accepted_hits.bam SRR1103957_sn
samtools view -o SRR1103957_sn.sam SRR1103957_sn.bam
samtools sort SRR1103957/accepted_hits.bam SRR1103957_s 
samtools index SRR1103957_s.bam
samtools sort -n SRR1103958/accepted_hits.bam SRR1103958_sn
samtools view -o SRR1103958_sn.sam SRR1103958_sn.bam
samtools sort SRR1103958/accepted_hits.bam SRR1103958_s 
samtools index SRR1103958_s.bam
samtools sort -n SRR1103959/accepted_hits.bam SRR1103959_sn
samtools view -o SRR1103959_sn.sam SRR1103959_sn.bam
samtools sort SRR1103959/accepted_hits.bam SRR1103959_s 
samtools index SRR1103959_s.bam
samtools sort -n SRR1103960/accepted_hits.bam SRR1103960_sn
samtools view -o SRR1103960_sn.sam SRR1103960_sn.bam
samtools sort SRR1103960/accepted_hits.bam SRR1103960_s 
samtools index SRR1103960_s.bam
samtools sort -n SRR1103961/accepted_hits.bam SRR1103961_sn
samtools view -o SRR1103960_sn.sam SRR1103960_sn.bam
samtools sort SRR1103961/accepted_hits.bam SRR1103960_s 
samtools index SRR1103960_s.bam
samtools sort -n SRR1103962/accepted_hits.bam SRR1103962_sn
samtools view -o SRR1103962_sn.sam SRR1103962_sn.bam
samtools sort SRR1103962/accepted_hits.bam SRR1103962_s
samtools index SRR1103962_s.bam
samtools sort -n SRR1103963/accepted_hits.bam SRR1103963_sn
samtools view -o SRR1103963_sn.sam SRR1103963_sn.bam
samtools sort SRR1103963/accepted_hits.bam SRR1103963_s 
samtools index SRR1103963_s.bam
samtools sort -n SRR1103964/accepted_hits.bam SRR1103964_sn
samtools view -o SRR1103964_sn.sam SRR1103964_sn.bam
samtools sort SRR1103964/accepted_hits.bam SRR1103964_s 
samtools index SRR1103964_s.bam
samtools sort -n SRR1103965/accepted_hits.bam SRR1103965_sn
samtools view -o SRR1103965_sn.sam SRR1103965_sn.bam
samtools sort SRR1103965/accepted_hits.bam SRR1103965_s
samtools index SRR1103965_s.bam
samtools sort -n SRR1103966/accepted_hits.bam SRR1103966_sn
samtools view -o SRR1103966_sn.sam SRR1103966_sn.bam
samtools sort SRR1103966/accepted_hits.bam SRR1103966_s
samtools index SRR1103966_s.bam
samtools sort -n SRR1103967/accepted_hits.bam SRR1103967_sn
samtools view -o SRR1103967_sn.sam SRR1103967_sn.bam
samtools sort SRR1103967/accepted_hits.bam SRR1103967_s 
samtools index SRR1103967_s.bam
samtools sort -n SRR1103968/accepted_hits.bam SRR1103968_sn
samtools view -o SRR1103968_sn.sam SRR1103968_sn.bam
samtools sort SRR1103968/accepted_hits.bam SRR1103968_s 
samtools index SRR1103968_s.bam
samtools sort -n SRR1103969/accepted_hits.bam SRR1103969_sn
samtools view -o SRR1103969_sn.sam SRR1103969_sn.bam
samtools sort SRR1103969/accepted_hits.bam SRR1103969_s 
samtools index SRR1103969_s.bam
samtools sort -n SRR1103970/accepted_hits.bam SRR1103970_sn
samtools view -o SRR1103970_sn.sam SRR1103970_sn.bam
samtools sort SRR1103970/accepted_hits.bam SRR1103970_sn 
samtools index SRR1103970_s.bam
samtools sort -n SRR1103971/accepted_hits.bam SRR1103971_sn
samtools view -o SRR1103971_sn.sam SRR1103971_sn.bam
samtools sort SRR1103971/accepted_hits.bam SRR1103971_s 
samtools index SRR1103971_s.bam
samtools sort -n SRR1103972/accepted_hits.bam SRR1103972_sn
samtools view -o SRR1103972_sn.sam SRR1103972_sn.bam
samtools sort SRR1103972/accepted_hits.bam SRR1103972_s 
samtools index SRR1103972_s.bam
samtools sort -n SRR1103973/accepted_hits.bam SRR1103973_sn
samtools view -o SRR1103973_sn.sam SRR1103973_sn.bam
samtools sort SRR1103973/accepted_hits.bam SRR1103973_s
samtools index SRR1103973_s.bam
samtools sort -n SRR1103974/accepted_hits.bam SRR1103974_sn
samtools view -o SRR1103974_sn.sam SRR1103974_sn.bam
samtools sort SRR1103974/accepted_hits.bam SRR1103974_s 
samtools index SRR1103974_s.bam
samtools sort -n SRR1103975/accepted_hits.bam SRR1103975_sn
samtools view -o SRR1103975_sn.sam SRR1103975_sn.bam
samtools sort SRR1103975/accepted_hits.bam SRR1103975_s 
samtools index SRR1103975_s.bam
samtools sort -n SRR1103976/accepted_hits.bam SRR1103976_sn
samtools view -o SRR1103976_sn.sam SRR1103976_sn.bam
samtools sort SRR1103976/accepted_hits.bam SRR1103976_s 
samtools index SRR1103976_s.bam
samtools sort -n SRR1103977/accepted_hits.bam SRR1103977_sn
samtools view -o SRR1103977_sn.sam SRR1103977_sn.bam
samtools sort SRR1103977/accepted_hits.bam SRR1103977_s 
samtools index SRR1103977_s.bam
samtools sort -n SRR1103978/accepted_hits.bam SRR1103978_sn
samtools view -o SRR1103978_sn.sam SRR1103978_sn.bam
samtools sort SRR1103978/accepted_hits.bam SRR1103978_s 
samtools index SRR1103978_s.bam
samtools sort -n SRR1103979/accepted_hits.bam SRR1103979_sn
samtools view -o SRR1103979_sn.sam SRR1103979_sn.bam
samtools sort SRR1103979/accepted_hits.bam 
samtools index SRR1103979_s.bam
samtools sort -n SRR1103980/accepted_hits.bam SRR1103980_sn
samtools view -o SRR1103980_sn.sam SRR1103980_sn.bam
samtools sort SRR1103980/accepted_hits.bam SRR1103980_s 
samtools index SRR1103980_s.bam
samtools sort -n SRR1103981/accepted_hits.bam SRR1103981_sn
samtools view -o SRR1103981_s.sam SRR1103981_sn.bam
samtools sort SRR1103981/accepted_hits.bam SRR1103968_s
samtools index SRR1103981_s.bam
samtools sort -n SRR1103982/accepted_hits.bam SRR1103982_sn
samtools view -o SRR1103982_sn.sam SRR1103982_sn.bam
samtools sort SRR1103982/accepted_hits.bam SRR1103982_s 
samtools index SRR1103982_s.bam
module unload python/2.7
module load htseq-count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103950.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103952.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103953.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103954.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103955.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103956.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103957.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103958.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103959.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103960.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103961.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103962.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103963.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103964.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103965.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103966.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103967.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103968.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103969.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103970.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103971.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103972.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103973.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103974.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103975.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103976.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103977.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103978.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103979.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103980.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103981.count
htseq-count -s no -a 4 --idattr=Dbxref .sam GCF_000004015.4_AaegL5.0_genomic.gff > SRR1103982.count
