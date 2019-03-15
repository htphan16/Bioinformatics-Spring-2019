#! /bin/bash

# After ssh into cluster account, make a directory on the cluster called 'kh_blast'
mkdir kh_blast

# Make sub-directory blastoutput, Osi_proteomes, FC_proteomes within khblast directory
cd kh_blast
mkdir Osi_proteomes
mkdir FC_proteomes
mkdir blastoutput

# Download protein sequences Folsomia candida of in FASTA format into FC_proteomes directory
cd FC_proteomes
curl -O ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/002/217/175/GCF_002217175.1_ASM221717v1/GCF_002217175.1_ASM221717v1_protein.faa.gz

# Prepare to blast the Folsomia candida protein sequence into the Osiris genes in fly database
# Unzip and make BLAST directories for proteome files for Folsomia candida
module load BLAST+/2.3.0
gunzip GCF_002217175.1_ASM221717v1_protein.faa.gz
makeblastdb -in GCF_002217175.1_ASM221717v1_protein.faa -parse_seqids -dbtype prot
cd ..

# Download protein sequence for all Osiris genes and save it to a file in Osi_proteomes directory
curl 'https://cluster.earlham.edu/~crsmith/DmelOsiProt.faa' > Osi_proteomes/fly_Osiris_protein_sequence.faa

# Blast the protein sequences of Osiris genes into the protein databases of Folsomia candida
module load BLAST+/2.3.0

# Write the full list of blast output for Folsomia candida protein sequence into a file called 'fc_protein_blast_full_list.txt'
blastp -db FC_proteomes/GCF_002217175.1_ASM221717v1_protein.faa -query Osi_proteomes/fly_Osiris_protein_sequence.faa -out blastoutput/fc_protein_blast_full_list.txt -outfmt 6

# Extract only the good hits for queries with e-value <= 0.05 and write them into a file called 'fc_protein_blast_good_hits.txt'
blastp -db FC_proteomes/GCF_002217175.1_ASM221717v1_protein.faa -query Osi_proteomes/fly_Osiris_protein_sequence.faa -evalue 0.05 -out blastoutput/fc_protein_blast_good_hits.txt -outfmt 6

cat blastoutput/fc_protein_blast_good_hits.txt

module load SAMtools/1.4

# Get IDs of the best protein hits
cut -f 2 blastoutput/fc_protein_blast_good_hits.txt | head -n 1 > blastoutput/fc_protein_best_hitID.txt

# Extract the protein sequence of the best hit into a file
xargs samtools faidx GCF_002217175.1_ASM221717v1_protein.faa < blastoutput/fc_protein_best_hitID.txt > blastoutput/fc_protein_sequence_best_hit.faa

# Create BLAST directories for proteome of Osiris gene
makeblastdb -in Osi_proteomes/fly_Osiris_protein_sequence.faa -parse_seqids -dbtype prot

# Blast Folsomia candida protein sequence into the Osiris protein database
module load BLAST+/2.3.0

# Write the full list of blast output for Osiris protein sequence into a file called 'osiris_protein_blast.txt'
blastp -db Osi_proteomes/fly_Osiris_protein_sequence.faa -query blastoutput/fc_protein_sequence_best_hit.faa -out blastoutput/osiris_protein_blast.txt -outfmt 6
# Extract only the good hits for queries with e-value <= 0.05 and write them into a file called 'osiris_protein_blast_good_hits.txt'
blastp -db Osi_proteomes/fly_Osiris_protein_sequence.faa -query blastoutput/fc_protein_sequence_best_hit.faa -evalue 0.05 -out blastoutput/osiris_protein_blast_good_hits.txt -outfmt 6

cat blastoutput/osiris_protein_blast_good_hits.txt
