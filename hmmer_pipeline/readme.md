# HMMER Analysis – Domain Identification with Pfam Database

This task demonstrates the installation of HMMER, the configuration of Pfam's domain database, and the use of `hmmscan` to scan protein sequences against the Pfam database for domain identification.

## Step 1: Install HMMER

1. **Download HMMER software**:
   
```bash
wget http://eddylab.org/software/hmmer/hmmer.tar.gz
```

2. **Extract the downloaded file**:

```bash
tar -xzvf hmmer.tar.gz
```

3. **Build and install HMMER**:

```bash
cd hmmer-*
./configure
make
make check
sudo make install
```

These commands install HMMER, a powerful bioinformatics tool for detecting sequence motifs and domains in protein sequences.

## Step 2: Prepare Pfam Database

1. **Download the Pfam-A HMM database**:

```bash
mkdir pfam_db
cd pfam_db
wget http://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/Pfam-A.hmm.gz
```

2. **Decompress the database**:

```bash
gunzip Pfam-A.hmm.gz
```

3. **Prepare the database with hmmpress**:

```bash
hmmpress Pfam-A.hmm
```

`hmmpress` optimizes the HMM database for faster searches.

## Step 3: Run HMMER Scan with hmmscan

We use the `hmmscan` tool to scan a protein sequence against the Pfam domains.

### Script Usage

```bash
./hmmer_pipeline.sh query_sequence.fasta
```

This script performs the following:

- Scans your protein query sequence against the Pfam database using `hmmscan`
- Outputs the scan results in two files:
  - A detailed output file (*_pfam.out)
  - A table of hits (*_pfam.tbl), which is used to extract the top 5 domains based on the lowest E-value
- The top hits are saved in *_top5_domains.txt

## Example Output of Top 5 Domains

Here are the top 5 domains identified from a protein query sequence:

```
I-set                 PF07679.22 query                -            2.6e-17   63.1   0.0   5.4e-17   62.1   0.0   1.6   1   0   0   1   1   1   1 Immunoglobulin I-set domain
Ig_3                  PF13927.12 query                -            6.6e-12   46.2   0.3   2.3e-11   44.5   0.3   2.0   1   0   0   1   1   1   1 Immunoglobulin domain
ig                    PF00047.31 query                -            3.5e-07   30.9   1.6   1.1e-06   29.3   1.6   1.9   1   0   0   1   1   1   1 Immunoglobulin domain
DUF1661               PF07877.16 query                -            1.5e-06   28.2   0.0   3.5e+02    1.4   0.0   8.5   9   0   0   9   9   9   0 Protein of unknown function (DUF1661)
Ig_2                  PF13895.12 query                -            9.1e-06   26.2   0.4   1.9e-05   25.2   0.4   1.5   1   0   0   1   1   1   1 Immunoglobulin domain
```

## 📋 Explanation of the Output

- **I-set (PF07679.22)**: E-value: 2.6e-17, Score: 63.1 – Strong signal, very confident that this is an I-set domain.
- **Ig_3 (PF13927.12)**: E-value: 6.6e-12, Score: 46.2 – Strong signal, belongs to the immunoglobulin superfamily.
- **ig (PF00047.31)**: E-value: 3.5e-07, Score: 30.9 – Moderate signal, also immunoglobulin-related.
- **DUF1661 (PF07877.16)**: E-value: 1.5e-06, Score: 28.2 – Weak signal, protein of unknown function (DUF).
- **Ig_2 (PF13895.12)**: E-value: 9.1e-06, Score: 26.2 – Weaker signal, but still part of the immunoglobulin superfamily.

## Explanation of the E-value and Score

- **E-value**: A low E-value indicates a highly significant match. The lower the E-value, the more confident we are that the match is not a random occurrence.
- **Score**: The higher the score, the stronger the match. It reflects the quality of the alignment between the query and the domain.

## What This Task Demonstrates

- Installing and configuring HMMER
- Setting up the Pfam database
- Running HMMER's hmmscan tool to identify domains in protein sequences
- Automating the process to extract and summarize the top domain hits

This task provides key skills for protein sequence analysis and domain identification using HMMER and the Pfam database.
