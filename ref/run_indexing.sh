#!/bin/bash
#SBATCH --job-name=index_genomes
#SBATCH --output=indexing.log
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=abportillo@coh.org
#SBATCH -n 10 # Number of cores
#SBATCH -N 1-4 # Min - Max Nodes
#SBATCH -p all
#SBATCH --mem=30G
#SBATCH --time=06:00:00


# Load modules if needed
module load bwa
module load bowtie2
# module load tophat

# BWA indexing
echo "Starting BWA indexing..."
bwa index -p ref/bwa_genome/genome ref/bwa_genome/genome.fa

# Bowtie2 indexing
echo "Starting Bowtie2 indexing..."
bowtie2-build ref/Bowtie2_genome/genome.fa ref/Bowtie2_genome/genome

# # Optional: build transcriptome index if needed
# echo "Generating transcriptome index with TopHat2..."
# tophat2 -G ref/genes.gtf --transcriptome-index=ref/Bowtie2_genome/known ref/Bowtie2_genome/genome

echo "Indexing complete."

