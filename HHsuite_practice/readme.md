# HHblits Setup and Protein Alignment

**Note**: This task does not include any shell script exercises; it simply demonstrates the final results. HH-suite setup is also part of the preparation for subsequent tasks.

## Overview

This task involves setting up **HHblits**, a tool from the HH-suite for performing sequence alignments using hidden Markov models (HMMs). It includes installing the necessary dependencies, setting up the environment, and running a protein sequence alignment using the **UniRef30** database.

## Steps

1. **Install Dependencies**:
   - Install `cmake`:
     ```bash
     pip install cmake
     ```
   - Clone the HH-suite repository from GitHub:
     ```bash
     git clone https://github.com/soedinglab/hh-suite.git
     ```

2. **Build HH-suite**:
   - Create a build directory and compile the HH-suite:
     ```bash
     mkdir -p hh-suite/build && cd hh-suite/build
     cmake -DCMAKE_INSTALL_PREFIX=/home/cxnnd/Bio_learning/bioinfo_tools_stage2/hh-suite-install -DCMAKE_CXX_COMPILER=g++ -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ..
     make && make install
     ```
   - Add HH-suite to the system path:
     ```bash
     export PATH=$PATH:/home/cxnnd/Bio_learning/bioinfo_tools_stage2/hh-suite-install/bin
     ```

3. **Download and Prepare the UniRef30 Database**:
   - Download the **UniRef30** database used by HHblits:
     ```bash
     wget http://wwwuser.gwdg.de/~compbiol/uniclust/2020_06/UniRef30_2020_06_hhsuite.tar.gz
     ```
   - Extract the downloaded file:
     ```bash
     tar -xvzf UniRef30_2020_06_hhsuite.tar.gz
     ```

4. **Run HHblits Alignment**:
   - Perform the protein sequence alignment using HHblits:
     ```bash
     hhblits -i query_HHblits.fasta -d ~/Bio_learning/bioinfo_tools_stage2/uniclust_db/uniclust30/UniRef30_2020_06 -oa3m query_HHblits.a3m -n 3
     ```
   - This will produce an **A3M** alignment file (`query_HHblits.a3m`) containing the top hits after three iterations.

## Output

- The output file `query_HHblits.a3m` will contain the multiple sequence alignment (MSA) in **A3M format**, which can be used for further analysis.
- The results are based on searching the provided query against the **UniRef30** database using HHblits.

## Summary

This task walks through the process of setting up HHblits, preparing the UniRef30 database, and performing a protein sequence alignment. This tool is useful for identifying homologous proteins by leveraging profile-based sequence alignment methods.

## Dependencies

- HH-suite (HHblits)
- UniRef30 database
- CMake
- g++

## Resources

- [HH-suite GitHub repository](https://github.com/soedinglab/hh-suite)
- [UniRef30 database](http://wwwuser.gwdg.de/~compbiol/uniclust/2020_06/)
