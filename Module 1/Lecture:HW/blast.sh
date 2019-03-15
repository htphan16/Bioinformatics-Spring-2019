#! /bin/bash

# Part I
# After ssh into cluster account, make a directory on the cluster called 'bioi', and within that make another directory called 'blast'
mkdir bioi
cd bioi
mkdir blast

# Part II
# Make sub-directories (folders) within your blast directory that using the following names:  “genomes”, “transcriptomes”, “proteomes”, “annotations”, “blastoutput”, “queries”
cd blast 
mkdir genomes
mkdir transcriptomes
mkdir proteomes
mkdir annotations
mkdir blastoutput
mkdir queries

# Download sequences in FASTA format for genome, transcript and protein into folders genomes, transcriptomes and proteomes respectively.

cd genomes

ls

curl -O ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/215/GCF_000001215.4_Release_6_plus_ISO1_MT/GCF_000001215.4_Release_6_plus_ISO1_MT_genomic.fna.gz
cd ../transcriptomes
curl -O ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/215/GCF_000001215.4_Release_6_plus_ISO1_MT/GCF_000001215.4_Release_6_plus_ISO1_MT_rna.fna.gz
cd ../proteomes
curl -O ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/215/GCF_000001215.4_Release_6_plus_ISO1_MT/GCF_000001215.4_Release_6_plus_ISO1_MT_protein.faa.gz

# Unzip all the files and make BLAST directories for each of genome, transcriptome and proteome files
module load BLAST+/2.3.0
cd ../genomes
gunzip GCF_000001215.4_Release_6_plus_ISO1_MT_genomic.fna.gz
makeblastdb -in GCF_000001215.4_Release_6_plus_ISO1_MT_genomic.fna -parse_seqids -dbtype nucl
cd ../transcriptomes
gunzip GCF_000001215.4_Release_6_plus_ISO1_MT_rna.fna.gz
makeblastdb -in GCF_000001215.4_Release_6_plus_ISO1_MT_rna.fna -parse_seqids -dbtype nucl
cd ../proteomes
gunzip GCF_000001215.4_Release_6_plus_ISO1_MT_protein.faa.gz
makeblastdb -in GCF_000001215.4_Release_6_plus_ISO1_MT_protein.faa -parse_seqids -dbtype prot

# Part IV
# Download protein sequence with gene ID Dmel_CG11648 and save it to a file in “queries” directory
cd ../queries
curl "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=protein&id=NP_996220.1&rettype=fasta&retmode=text" > NP_996220.1.faa
cd ..

# BLASTp the downloaded protein sequence into the proteome file
module load BLAST+/2.3.0
blastp -db proteomes/GCF_000001215.4_Release_6_plus_ISO1_MT_protein.faa -query queries/NP_996220.1.faa -out blastoutput/dm_protein_blast.txt -outfmt 6
# Read only the best hit output
head -n 1 blastoutput/dm_protein_blast.txt

# Part V
module load SAMtools/1.4
# Get IDs of the best protein hit
cut -f 2 blastoutput/dm_protein_blast.txt | head -n 1 > protein_best_hitID.txt

# Extract the protein sequence of the best hit into a file
xargs samtools faidx proteomes/GCF_000001215.4_Release_6_plus_ISO1_MT_protein.faa < protein_best_hitID.txt > protein_sequence_best_hit.faa

# tBLASTn the best hit protein sequence into the transcriptome file, then read only the best hit output
module load BLAST+/2.3.0
tblastn -db transcriptomes/GCF_000001215.4_Release_6_plus_ISO1_MT_rna.fna -query protein_sequence_best_hit.faa -out blastoutput/dm_transcriptome_blast.txt -outfmt 6

head -1 blastoutput/dm_transcriptome_blast.txt

# Get ID of the best transcriptome hit
cut -f 2 blastoutput/dm_transcriptome_blast.txt | head -n 1 > transcriptome_best_hitID.txt

# Extract the transcriptome sequence of the best hit into a file
xargs samtools faidx transcriptomes/GCF_000001215.4_Release_6_plus_ISO1_MT_rna.fna < transcriptome_best_hitID.txt > transcriptome_best_hit.fna




