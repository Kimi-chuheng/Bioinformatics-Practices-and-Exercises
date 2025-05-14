# Makefile for CASP target analysis

# Input and output directories
INPUT_DIR := targets
OUTPUT_DIR := output

# Input files: all processed FASTA files
TARGETS := $(wildcard $(INPUT_DIR)/*.fasta)

# Output files: A3M file corresponding to each target
MSA_FILES := $(TARGETS:$(INPUT_DIR)/%.fasta=$(OUTPUT_DIR)/%.a3m)

# Output files: analysis report corresponding to each target
REPORTS := $(TARGETS:$(INPUT_DIR)/%.fasta=$(OUTPUT_DIR)/%_report.txt)

# Default target
all: $(MSA_FILES) $(REPORTS)

# Rule: Convert FASTA files to A3M files
$(OUTPUT_DIR)/%.a3m: $(INPUT_DIR)/%.fasta
	hhblits -i $< -d ../uniclust_db/uniclust30/UniRef30_2020_06 -oa3m $@ -n 3


# Rule: Generate report using the analysis script
$(OUTPUT_DIR)/%_report.txt: $(OUTPUT_DIR)/%.a3m $(INPUT_DIR)/%.fasta
	./analyze_alignment.sh $^ > $@

# Clean target: remove generated A3M files and reports
clean:
	rm -f $(MSA_FILES) $(REPORTS)

