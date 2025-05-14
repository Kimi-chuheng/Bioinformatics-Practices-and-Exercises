#!/bin/bash
# visualize_results.sh - Generate interactive MSA analysis visualization
msa_dir="msa_stats"
out_dir="reports"
mkdir -p $out_dir

# Run Python script to generate interactive visualization
python3 <<EOF
import os
import pandas as pd
import plotly.express as px

msa_dir = "$msa_dir"
out_dir = "$out_dir"

# Collect statistics data for all MSA
targets = []
seq_counts = []
conservations = []
for stats_file in [f for f in os.listdir(msa_dir) if f.endswith("_stats.txt")]:
    target = stats_file.split("_stats")[0]
    targets.append(target)
    
    with open(os.path.join(msa_dir, stats_file)) as f:
        lines = f.readlines()
        seq_counts.append(int(lines[0].split(": ")[1]))
        conservations.append(float(lines[3].split(": ")[1]))

# Create DataFrame with data
df = pd.DataFrame({
    'Target': targets,
    'Sequence_Count': seq_counts,
    'Conservation': conservations
})

# Create interactive plot
fig = px.scatter(df, x='Sequence_Count', y='Conservation', 
                 hover_name='Target',
                 hover_data=['Target', 'Sequence_Count', 'Conservation'],
                 title='Sequence Diversity Analysis for CASP14 Target Proteins',
                 labels={'Sequence_Count': 'Sequence Count', 
                         'Conservation': 'Proportion of Conserved Positions'})

# Customize appearance
fig.update_traces(marker=dict(size=10, opacity=0.7),
                  selector=dict(mode='markers'))
fig.update_layout(
    plot_bgcolor='white',
    hoverlabel=dict(bgcolor="white", font_size=12),
    xaxis=dict(showgrid=True, gridwidth=1, gridcolor='lightgray'),
    yaxis=dict(showgrid=True, gridwidth=1, gridcolor='lightgray')
)

# Save as HTML (interactive)
fig.write_html(os.path.join(out_dir, "conservation_vs_seqcount_interactive.html"))

EOF

echo "Interactive visualization report has been generated in the $out_dir directory"
