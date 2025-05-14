import subprocess
import sys

def run_hmmer(fasta_file, hmmer_db, output_file):
    """Run HMMER to align protein sequences"""
    command = [
        "hmmscan",
        "--tblout", output_file,
        hmmer_db,
        fasta_file
    ]
    try:
        subprocess.run(command, check=True)  
        print(f"HMMER alignment results have been saved to {output_file}")
    except subprocess.CalledProcessError as e:
        print(f"Failed to run HMMER: {e}")
    except Exception as e:
        print(f"An error occurred: {e}")

def main():
    # Check command-line arguments
    if len(sys.argv) != 3:
        print("Please provide two arguments: the FASTA file path and the output file path.")
        sys.exit(1)

    # Get file paths from command-line arguments
    fasta_file = sys.argv[1]  # First argument: FASTA file path
    output_file = sys.argv[2]  # Second argument: output result file path
    
    # Assuming the HMMER database path is fixed, you can change it to your own path
    hmmer_db = "/home/cxnnd/Bio_learning/bioinfo_tools_stage2/pfam_db/Pfam-A.hmm"
    
    # Call run_hmmer function to perform HMMER alignment
    run_hmmer(fasta_file, hmmer_db, output_file)

if __name__ == "__main__":
    main()

