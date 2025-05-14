# CASP14 Target Analysis

This fold contains scripts and tools for performing analysis on protein targets from the CASP14 dataset, focusing on sequence alignment, prediction confidence, and further structure prediction recommendations.

## Download and Prepare CASP14 Sequences

1. **Create directory structure and download CASP14 sequence file:**

```bash
mkdir -p casp14/whole_file
cd casp14/whole_file
wget "https://predictioncenter.org/download_area/CASP14/sequences/casp14.seq.txt" -O "casp14.fa"
sed '205,207d' casp14.fa > casp14_dedup.fa # Remove duplicate entry for T1085
```

2. **Manually split the sequence file:**
   After downloading, you'll need to manually split the file into individual FASTA files with one sequence per file. Create a "targets" directory and save each sequence with its corresponding target number as the filename.

```bash
mkdir -p targets
# Manually split the file into individual FASTA files
# Each file should be named with the target number (e.g., T1000.fasta)
```

You can also use this command to automatically split the sequences:

```bash
awk '/^>/{f="targets/" substr($0,2) ".fasta"} {print > f}' casp14_dedup.fa
```

##  Tools Used

- **hhblits**: A tool for sequence alignment based on HMM (Hidden Markov Model).
- **Makefile**: Automates the conversion of FASTA files to A3M format and generates analysis reports.

##  Makefile for CASP Target Analysis

### Setup:
The provided Makefile automates the conversion of FASTA files to A3M files and generates an analysis report for each target sequence.

- **Input Directory**: Contains the FASTA files for CASP targets.
- **Output Directory**: Stores the A3M files and analysis reports.

### Rules:
- Convert FASTA files to A3M using hhblits.
- Generate a report for each target using the analyze_alignment.sh script.
- Clean: Removes generated A3M files and reports.


## Run the Makefile

You can run the Makefile to process all the sequences:

```bash
make
```

This will generate the A3M files and corresponding analysis reports for each target.

## Script: analyze_alignment.sh

The analyze_alignment.sh script performs the following analyses:

- **Sequence Information**: Extracts sequence length and amino acid composition.
- **MSA Analysis**: Evaluates the number of sequences in the multiple sequence alignment (MSA) and coverage depth.
- **Prediction Confidence Assessment**: Provides an estimate of the confidence of structure prediction based on the number of homologous sequences found.
- **Recommendations**: Suggests further steps for protein structure prediction.

You can run this script directly with the following command:

```bash
./analyze_alignment.sh <a3m_file> <fasta_file>
```

Example:

```bash
./analyze_alignment.sh output/target1.a3m targets/target1.fasta
```

##  Example Report Output

The report generated includes sections like:

- **Target Sequence Analysis**: Basic sequence information, amino acid composition, and any unusual amino acids.
- **MSA Analysis**: Number of sequences and coverage of the alignment.
- **Prediction Confidence Assessment**: A confidence estimate based on sequence count.
- **Recommendations**: Next steps for protein structure prediction.

##  Report Sample

An example of an analysis report generated for a CASP14 target sequence is shown below:

---

### **Analysis Report for Target: T1024**

**Generated on**: Tue May 13 15:33:12 CDT 2025

#### 1. **Target Sequence Analysis**

**1.1 Basic Sequence Information**  
  - **Sequence length**: 408 amino acids  
  This indicates the protein is of medium length.

**1.2 Amino Acid Composition**  
Here’s the distribution of amino acids in the protein sequence:
  - **L (Leucine)**: 54 (13.23%)
  - **I (Isoleucine)**: 40 (9.80%)
  - **A (Alanine)**: 39 (9.55%)
  - **V (Valine)**: 33 (8.08%)
  - **F (Phenylalanine)**: 33 (8.08%)
  - **T (Threonine)**: 32 (7.84%)
  - ... (others listed in the same format)

This suggests that hydrophobic and structural amino acids (e.g., Leucine, Isoleucine, Valine, Phenylalanine) are abundant, indicating the possible presence of helices or a hydrophobic core.

**1.3 Non-standard Amino Acids**  
  - No non-standard amino acids detected. This indicates the sequence is of good quality without ambiguous residues (e.g., B, Z, X).

**1.4 Prediction Information**  
  - **PSIPRED** not found. Secondary structure prediction skipped.  
This is just an informational message and not an error.

---

#### 2. **Multiple Sequence Alignment (MSA) Analysis**

**2.1 MSA Statistics**  
  - **Number of sequences in alignment**: 1459  
  This is considered a deep alignment, which enhances the accuracy of structure prediction.

**2.2 Alignment Coverage Analysis**  
  - **Alignment depth assessment**: Based on the sequence count  
  - **Deep alignment (>500 sequences)**  
  A deep alignment with many homologous sequences increases the reliability of evolutionary signals and structure predictions.

---

#### 3. **Structure Prediction Confidence Assessment**

**3.1 Prediction Confidence Estimate**  
  - **HIGH CONFIDENCE**: Many homologous sequences found (1459)  
  - Structure prediction is likely to be **accurate** based on this alignment.  

The large number of sequences suggests a high level of confidence in structure prediction, using tools like **AlphaFold2** or **RoseTTAFold**.

---

#### 4. **Recommendations**

**4.1 Next Steps**  
  - Proceed with **AlphaFold2** or **RoseTTAFold** for structure modeling.  
  The alignment quality is high, ensuring good quality predictions.

**4.2 Additional Analyses to Consider**  
  - **Conserved domain search** (e.g., using NCBI CDD, Pfam)  
  - **Transmembrane region prediction**  
  - **Signal peptide prediction**  
  - **Disorder prediction**  

These additional analyses can help further understand the protein's function and structure.

---

**End of report for T1024**
---

## Report Interpretation

### **1. Target Sequence Analysis**
This section provides basic analysis of the target protein sequence:

- **1.1 Basic Sequence Information**: The sequence length is 408 amino acids, indicating a medium-sized protein.
- **1.2 Amino Acid Composition**: The most frequent amino acids include hydrophobic residues such as Leucine, Isoleucine, and Valine, which might suggest the presence of helices or a hydrophobic core region in the structure.
- **1.3 Non-standard Amino Acids**: No non-standard amino acids (e.g., B, Z, X, U) were found, indicating a clean sequence.
- **1.4 Prediction Information**: **PSIPRED** is not available in the current setup, so secondary structure prediction was skipped (not an error).

### **2. Multiple Sequence Alignment (MSA) Analysis**
This section reviews the multiple sequence alignment:

- **2.1 MSA Statistics**: The MSA contains 1459 sequences, which is a deep alignment. This depth helps improve the accuracy of evolutionary signals used for structure prediction.
- **2.2 Alignment Coverage Analysis**: The alignment is deep (greater than 500 sequences), indicating reliable coverage for structure prediction.

### **3. Structure Prediction Confidence Assessment**
- **3.1 Prediction Confidence Estimate**: Given the large number of homologous sequences (1459), the confidence in structure prediction is **high**. Tools like **AlphaFold2** or **RoseTTAFold** are recommended for structure modeling, as they will likely provide accurate predictions based on the available data.

### **4. Recommendations**
- **4.1 Next Steps**: With the high-quality alignment, it's advisable to proceed with structure modeling using **AlphaFold2** or **RoseTTAFold**.
- **4.2 Additional Analyses**: Further analyses such as domain identification, transmembrane region prediction, signal peptide prediction, and disorder prediction can be useful to understand the protein's biological function and properties.

---




# MSA Quality Assessment and Visualization

This second part contains scripts to assess the quality of multiple sequence alignments (MSA) and generate interactive visualizations. The goal is to evaluate sequence diversity and conservation in the alignment, which is crucial for structural predictions and protein analysis.

##  How It Works

### 1. **MSA Quality Assessment**

The `assess_msa.sh` script evaluates the quality of a multiple sequence alignment (MSA) in an A3M format file. It performs the following assessments:

- **Number of sequences**: Counts how many sequences are included in the alignment.
- **Alignment length**: Measures the number of aligned positions (amino acids).
- **Average diversity**: Calculates the average diversity of each aligned position (how many unique amino acids appear at each position, excluding gaps).
- **Number of conserved positions**: Counts the positions in the alignment where all sequences are identical.

#### Usage:

```bash
./assess_msa.sh <path_to_a3m_file>
```

The script will output the results into a `msa_stats` folder, including a `.txt` file containing the statistics.

Example output:

```yaml
Number of sequences: 2242
Alignment length: 268
Average diversity: 36.03
Number of conserved positions: 0
```

#### Output Explanation:

- **Number of sequences**: 2242 sequences (including the target sequence and its homologs). This is considered a deep alignment, which is ideal for structure prediction.

- **Alignment length**: 268 amino acids aligned. If the original sequence is longer, this could indicate truncation or clipping.

- **Average diversity**: 36.03. This means there are 36 unique amino acids on average at each position (excluding gaps), which indicates high variability in the target region.

- **Number of conserved positions**: 0. No positions are conserved across all sequences, suggesting this region is highly variable, and may represent a flexible or disordered region of the protein (such as IDRs - intrinsically disordered regions).

### 2. **Visualization of MSA Results**

After generating the MSA statistics, you can visualize the results interactively. The `visualize_results.sh` script generates an interactive plot using Plotly, showing the relationship between sequence count and conservation.

#### Usage:

```bash
./visualize_results.sh
```

This script will read the statistics files from the `msa_stats` folder and create an interactive scatter plot. The plot will display the following:

- **X-axis**: Number of sequences in the alignment.
- **Y-axis**: Proportion of conserved positions (number of positions with identical residues in all sequences).
- **Hover information**: The target protein's name, number of sequences, and conservation score.

The interactive plot is saved as an HTML file (`conservation_vs_seqcount_interactive.html`) in the `reports` directory.

### 3. **Example Output for MSA Statistics:**

Sample report:

```yaml
Number of sequences: 2242
Alignment length: 268
Average diversity: 36.03
Number of conserved positions: 0
```

- **Number of sequences**: 2242
- **Alignment length**: 268
- **Average diversity**: 36.03 (high diversity)
- **Conserved positions**: 0 (no conserved positions, indicating high variability)

### 4. **Visualized Report:**

The interactive plot `conservation_vs_seqcount_interactive.html` visualizes:

- How many sequences were used for the alignment.
- The conservation level at each sequence position.

The scatter plot helps you visually explore the relationship between sequence diversity and conservation across different CASP14 targets.

##  Directory Structure

- `msa_stats/`: Contains the MSA quality assessment output (`_stats.txt` files).
- `reports/`: Contains the generated interactive visualization reports (`conservation_vs_seqcount_interactive.html`).

##  Getting Started

### Run the MSA quality assessment:
Run `assess_msa.sh` on each A3M file to generate the MSA quality statistics.

Example:

```bash
./assess_msa.sh my_alignment.a3m
```

### Visualize the results:
Run `visualize_results.sh` to generate an interactive visualization.

Example:

```bash
./visualize_results.sh
```

##  Additional Notes

- The scripts assume you have Python 3 installed along with necessary packages (pandas, plotly).
- You can customize the input paths and adjust the scripts as needed for your specific use case.
