#!/bin/bash

# analyze_alignment.sh - Analyze protein sequences and their alignments
# Usage: ./analyze_alignment.sh <a3m_file> <fasta_file>

# Exit on error
set -e

# Check if we have the right arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <a3m_file> <fasta_file>"
    exit 1
fi

A3M_FILE=$1
FASTA_FILE=$2
TARGET_NAME=$(basename "$FASTA_FILE" .fasta)

echo "===================================================="
echo "ANALYSIS REPORT FOR TARGET: $TARGET_NAME"
echo "===================================================="
echo "Generated on: $(date)"
echo ""

# ========== SECTION 1: Target Sequence Analysis ==========
echo "--------- 1. TARGET SEQUENCE ANALYSIS ---------"

# Get sequence length and composition
echo "1.1 Basic Sequence Information:"
SEQ_LENGTH=$(grep -v "^>" "$FASTA_FILE" | tr -d '\n' | wc -c)
echo "  - Sequence length: $SEQ_LENGTH amino acids"

# Count amino acid types
echo "1.2 Amino Acid Composition:"
AA_COUNTS=$(grep -v "^>" "$FASTA_FILE" | tr -d '\n' | grep -o . | sort | uniq -c | sort -nr)
echo "$AA_COUNTS" | while read COUNT AA; do
    PERCENT=$(echo "scale=2; $COUNT * 100 / $SEQ_LENGTH" | bc)
    echo "  - $AA: $COUNT ($PERCENT%)"
done

# Check for unusual amino acids
UNUSUAL=$(grep -v "^>" "$FASTA_FILE" | tr -d '\n' | grep -o "[BZXU]" | sort | uniq -c)
if [ -n "$UNUSUAL" ]; then
    echo "1.3 Non-standard amino acids detected:"
    echo "$UNUSUAL"
else
    echo "1.3 No non-standard amino acids detected."
fi

# Secondary structure prediction if appropriate tools are available
echo "1.4 Prediction Information:"
if command -v psipred &> /dev/null; then
    echo "  - PSIPRED could be used for secondary structure prediction"
else
    echo "  - PSIPRED not found. Secondary structure prediction skipped."
fi

# ========== SECTION 2: MSA Analysis ==========
echo ""
echo "--------- 2. MULTIPLE SEQUENCE ALIGNMENT ANALYSIS ---------"

# Count sequences in the MSA
SEQ_COUNT=$(grep -c "^>" "$A3M_FILE" || true)
echo "2.1 MSA Statistics:"
echo "  - Number of sequences in alignment: $SEQ_COUNT"

# Effective sequence count calculation (simple version)
if [ "$SEQ_COUNT" -gt 1 ]; then
    echo "  - MSA has multiple sequences - good for structure prediction"
else
    echo "  - WARNING: MSA has only the query sequence - poor alignment"
fi

# Coverage analysis
echo "2.2 Alignment Coverage Analysis:"
# Extract only aligned sequences (excluding the query)
TEMP_ALIGNED=$(mktemp)
sed '1,2d' "$A3M_FILE" > "$TEMP_ALIGNED"

if [ -s "$TEMP_ALIGNED" ]; then
    # Count positions with good coverage (>50% of sequences have residue)
    # This is a simplified approximation
    GOOD_POSITIONS=0
    POOR_POSITIONS=0
    
    echo "  - Alignment depth assessment: based on sequence count"
    if [ "$SEQ_COUNT" -lt 5 ]; then
        echo "    * Very shallow alignment (<5 sequences)"
    elif [ "$SEQ_COUNT" -lt 50 ]; then
        echo "    * Shallow alignment (5-50 sequences)"
    elif [ "$SEQ_COUNT" -lt 500 ]; then
        echo "    * Moderate alignment (50-500 sequences)"
    else
        echo "    * Deep alignment (>500 sequences)"
    fi
else
    echo "  - No aligned sequences found other than the query"
fi
rm "$TEMP_ALIGNED"

# ========== SECTION 3: Prediction Confidence Assessment ==========
echo ""
echo "--------- 3. STRUCTURE PREDICTION CONFIDENCE ASSESSMENT ---------"

echo "3.1 Prediction Confidence Estimate:"
if [ "$SEQ_COUNT" -lt 10 ]; then
    echo "  - LOW CONFIDENCE: Few homologous sequences found ($SEQ_COUNT)"
    echo "  - Structure prediction may be challenging"
    echo "  - Consider additional search methods or experimental approaches"
elif [ "$SEQ_COUNT" -lt 100 ]; then
    echo "  - MEDIUM CONFIDENCE: Moderate number of homologs found ($SEQ_COUNT)"
    echo "  - Structure prediction likely to have reasonable accuracy"
else
    echo "  - HIGH CONFIDENCE: Many homologous sequences found ($SEQ_COUNT)"
    echo "  - Structure prediction likely to be accurate"
fi

# ========== SECTION 4: Recommendations ==========
echo ""
echo "--------- 4. RECOMMENDATIONS ---------"

echo "4.1 Next Steps:"
if [ "$SEQ_COUNT" -lt 50 ]; then
    echo "  - Try deeper sequence search (more iterations, different databases)"
    echo "  - Consider using AlphaFold2 with templates"
else
    echo "  - Proceed with folding using AlphaFold2 or RoseTTAFold"
    echo "  - Expected good quality prediction based on alignment depth"
fi

# Look for specific motifs or domains if needed
echo "4.2 Additional Analyses to Consider:"
echo "  - Conserved domain search (NCBI CDD, Pfam)"
echo "  - Transmembrane region prediction"
echo "  - Signal peptide prediction"
echo "  - Disorder prediction"

echo ""
echo "===================================================="
echo "End of report for $TARGET_NAME"
echo "===================================================="
