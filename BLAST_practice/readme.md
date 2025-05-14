# BLAST Analysis – Nucleotide Sequence Matching

This task involves setting up and using the BLAST+ (Basic Local Alignment Search Tool) toolkit to perform sequence alignment against a nucleotide database. It includes downloading the BLAST software, creating a searchable database, running a query, and interpreting the results.

## Step 1: Download and Install BLAST+

```bash
# Download the latest version of BLAST+
wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-*+-x64-linux.tar.gz

# Extract the downloaded archive
tar -xzvf ncbi-blast-*+-x64-linux.tar.gz

# Add BLAST binaries to your PATH
export PATH=$PATH:$PWD/ncbi-blast-*+/bin
```

`wget` is a command-line tool used to download files from the internet.
The above command fetches the latest version of the BLAST+ suite from NCBI.

## Step 2: Prepare the Database

Download and decompress the reference genome if not already done:

```bash
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/009/858/895/GCF_009858895.2_ASM985889v3/GCF_009858895.2_ASM985889v3_genomic.fna.gz
gunzip GCF_009858895.2_ASM985889v3_genomic.fna.gz
```

Create a BLAST database from the FASTA file:

```bash
makeblastdb -in GCF_009858895.2_ASM985889v3_genomic.fna -dbtype nucl -out ./blast_db/genomic_blast_db
```

`makeblastdb` creates a searchable nucleotide database from the input FASTA file.

## Step 3: Run a BLAST Search

### Usage:

```bash
./run_blast.sh my_query.fasta ./blast_db/genomic_blast_db
```

This will search the query sequence against the local nucleotide database and save the top 10 hits in a tab-separated format.

## Output Format Explanation

The script uses `-outfmt "6 qseqid sseqid pident length evalue"` for concise tabular output. Each column means:

| Column | Description |
|--------|-------------|
| qseqid | Query sequence ID |
| sseqid | Subject (matched) sequence ID in the database |
| pident | Percent identity between query and subject |
| length | Alignment length in base pairs |
| evalue | Expectation value – probability of a random match |

## Example Output:

```
query1    NC_045512.2    97.500    80    2.31e-35
```

## Interpretation:

- NC_045512.2 is the GenBank accession for the reference SARS-CoV-2 genome.
- 97.5% identity over an 80 bp alignment suggests a strong match.
- E-value 2.31e-35 indicates an extremely significant alignment – not likely to be random.
- This suggests that the query sequence is either from SARS-CoV-2 or a closely related coronavirus.

## What This Task Demonstrates

- Installing and configuring BLAST+
- Creating a nucleotide database from FASTA files
- Automating batch BLAST searches with shell scripts
- Interpreting alignment results in a biological context

This task showcases core skills for working with sequence alignment tools in bioinformatics.
