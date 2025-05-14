# Bioinformatics Practices and Exercises

This repository contains my completed exercises and projects for the Bioinformatics course. Each section demonstrates understanding and application of key bioinformatics concepts, tools, and methodologies through hands-on implementation and analysis.

## Table of Contents

- [Overview](#overview)
- [GC Content Analysis](#gc-content-analysis)
- [BLAST Analysis](#blast-analysis)
- [HHblits Setup and Protein Alignment](#hhblits-setup-and-protein-alignment)
- [Multiple Sequence Alignment Tool Comparison](#multiple-sequence-alignment-tool-comparison)
- [HMMER Analysis](#hmmer-analysis)
- [HMMER Protein Sequence Visualization](#hmmer-protein-sequence-visualization)
- [CASP14 Target Analysis](#casp14-target-analysis)
- [MSA Quality Assessment and Visualization](#msa-quality-assessment-and-visualization)
- [Future Work](#future-work)
- [References](#references)

## Overview

This project portfolio showcases my practical understanding of bioinformatics techniques and tools. Each exercise demonstrates proficiency in handling different bioinformatics data formats, implementing analysis pipelines, and interpreting results in a biological context. The work presented here covers sequence analysis, alignment techniques, domain identification, and protein structure analysis.

## GC Content Analysis

Implementation of Bash scripts for basic genomic analysis of FASTA files.

### Learning Objectives

- Text processing of biological sequence data
- Linux shell scripting for bioinformatics
- FASTA format parsing and content analysis
- Batch processing of multiple genomic files

### Key Implementations

- `gc_content.sh`: Calculates GC content in a single FASTA file
- `batch_gc.sh`: Processes multiple files for GC content analysis
- `batch_gc_summary.sh`: Generates summary statistics for all analyzed files
- `fasta_info.sh`: Reports sequence count and total base count
- `extract_sequence.sh`: Extracts specific sequences by ID

## BLAST Analysis

Setup and usage of BLAST+ for sequence alignment against nucleotide databases.

### Learning Objectives

- Installation and configuration of BLAST+
- Creating searchable nucleotide databases
- Running similarity searches with custom parameters
- Interpreting alignment results in biological context

### Key Implementations

- Setup of BLAST+ from source
- Creation of a custom nucleotide database
- Implementation of a BLAST search pipeline
- Result parsing and biological interpretation

## HHblits Setup and Protein Alignment

Configuration of HHblits and application for protein sequence alignment using hidden Markov models.

### Learning Objectives

- Understanding profile-based sequence alignment methods
- Setting up complex bioinformatics tools
- Working with the UniRef30 database
- Interpreting HMM-based alignment results

### Key Implementations

- HH-suite installation and configuration
- UniRef30 database preparation
- HHblits alignment pipeline
- Output interpretation in A3M format

## Multiple Sequence Alignment Tool Comparison

Comparative analysis of three popular MSA tools: MUSCLE, ClustalW, and MAFFT.

### Learning Objectives

- Comparative evaluation of bioinformatics algorithms
- Understanding the strengths and limitations of different MSA approaches
- Benchmarking alignment accuracy and performance
- Interpreting alignment characteristics

### Key Implementations

- Installation and configuration of three MSA tools
- Execution of alignments on the same dataset
- Comparative analysis of output alignments
- Evaluation of algorithm behavior and performance

## HMMER Analysis

Implementation of domain identification using HMMER and the Pfam database.

### Learning Objectives

- Protein domain identification techniques
- Working with profile hidden Markov models
- Statistical interpretation of alignment significance
- Biological interpretation of domain architecture

### Key Implementations

- HMMER installation and configuration
- Pfam database setup
- Domain scanning pipeline
- Results filtering and interpretation

## HMMER Protein Sequence Visualization

Development of visualization tools for HMMER analysis results using R.

### Learning Objectives

- Data visualization techniques for bioinformatics
- Integration of Python and R in analysis pipelines
- Statistical interpretation of domain significance
- Workflow automation with shell scripting

### Key Implementations

- Python script for HMMER execution
- R script for results visualization
- Integration through Bash workflow
- Generation of publication-quality figures

## CASP14 Target Analysis

Analysis pipeline for protein targets from the CASP14 dataset.

### Learning Objectives

- Working with public protein structure datasets
- Large-scale sequence analysis
- Assessment of prediction confidence
- Development of analysis reports

### Key Implementations

- CASP14 data acquisition pipeline
- Automated processing of multiple targets
- Generation of comprehensive analysis reports
- Prediction confidence assessment framework

## MSA Quality Assessment and Visualization

Tools and metrics for evaluating the quality of multiple sequence alignments.

### Learning Objectives

- Quality assessment of bioinformatics results
- Interactive data visualization
- Advanced sequence conservation analysis
- Integration of bioinformatics and data science

### Key Implementations

- MSA quality metrics calculation
- Interactive visualization with Plotly
- Conservation and diversity analysis
- Statistical interpretation of alignment features

## Future Work

This project is being extended to explore structure prediction using AlphaFold3 with the generated A3M files. Due to current computational resource limitations, this phase is pending until alternative storage solutions become available. The current MSA results have been prepared and are ready for structure prediction once resources are secured. This expansion would demonstrate practical application of state-of-the-art AI methods in structural bioinformatics.

## References

- NCBI Database Resources: https://www.ncbi.nlm.nih.gov/
- HMMER Documentation: http://hmmer.org/
- HH-suite GitHub repository: https://github.com/soedinglab/hh-suite
- Pfam Database: http://pfam.xfam.org/
- CASP14 Dataset: https://predictioncenter.org/casp14/
- AlphaFold Documentation: https://alphafold.ebi.ac.uk/
