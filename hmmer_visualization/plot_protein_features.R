library(ggplot2)
library(dplyr)

# Read HMMER output results
# Use comment.char="#" to skip lines starting with #
hmmer_results <- read.table("hmmer_results.tbl", 
                           header = FALSE, 
                           comment.char = "#", 
                           stringsAsFactors = FALSE,
                           fill = TRUE,  # Allow different numbers of columns in rows
                           quote = "") # Do not treat any characters as quotes

# Check data structure
print(dim(hmmer_results))
print(head(hmmer_results, 3))

# HMMER tblout format usually has 18 columns, but the last column description might contain spaces
# Set column names according to the HMMER tblout format
colnames(hmmer_results) <- c("target_name", "target_accession", "query_name", "query_accession", 
                            "evalue", "score", "bias", "domain_evalue", "domain_score", 
                            "domain_bias", "exp", "reg", "clu", "ov", "env", "dom", 
                            "rep", "inc", "description")

# Merge description column (if there are extra columns)
if(ncol(hmmer_results) > 19) {
  for(i in 20:ncol(hmmer_results)) {
    hmmer_results$description <- paste(hmmer_results$description, hmmer_results[[i]], sep=" ")
  }
  hmmer_results <- hmmer_results[, 1:19]
}

# Convert E-value and score to numeric types
hmmer_results$evalue <- as.numeric(as.character(hmmer_results$evalue))
hmmer_results$score <- as.numeric(as.character(hmmer_results$score))
hmmer_results$domain_evalue <- as.numeric(as.character(hmmer_results$domain_evalue))
hmmer_results$domain_score <- as.numeric(as.character(hmmer_results$domain_score))

# Ensure E-values are valid (remove NA or infinite values)
hmmer_results <- hmmer_results[!is.na(hmmer_results$evalue) & is.finite(hmmer_results$evalue), ]

# Create a column for -log10(E-value) for plotting
hmmer_results$neg_log_evalue <- -log10(hmmer_results$evalue)

# 1. Plot relationship between score and E-value
p1 <- ggplot(hmmer_results, aes(x = score, y = evalue)) +
  geom_point(aes(color = score), size = 3, alpha = 0.7) +
  scale_y_log10() +  # Use logarithmic scale for E-value
  scale_color_viridis_c() +
  labs(title = "HMMER Alignment Score vs E-value",
       x = "Alignment Score",
       y = "E-value (Log Scale)") +
  theme_minimal() +
  theme(legend.position = "right")

# 2. Bar plot of top 10 matching results
top_hits <- hmmer_results %>%
  arrange(evalue) %>%
  head(10)

p2 <- ggplot(top_hits, aes(x = reorder(target_name, -score), y = score)) +
  geom_bar(stat = "identity", aes(fill = neg_log_evalue), width = 0.7) +
  scale_fill_viridis_c(name = "-log10(E-value)") +
  labs(title = "Top 10 HMMER Matching Scores",
       x = "Target Domain Name",
       y = "Score") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# 3. Display E-value significance (-log10(E-value))
p3 <- ggplot(top_hits, aes(x = reorder(target_name, -neg_log_evalue), y = neg_log_evalue)) +
  geom_bar(stat = "identity", aes(fill = neg_log_evalue), width = 0.7) +
  scale_fill_viridis_c() +
  labs(title = "HMMER Result Significance",
       x = "Target Domain Name",
       y = "-log10(E-value)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Output diagnostic information for debugging
print("Data Summary:")
print(summary(hmmer_results))
print("First 5 rows of data:")
print(head(hmmer_results[,c("target_name", "score", "evalue", "description")], 5))

# Save the images
ggsave("hmmer_score_vs_evalue.pdf", p1, width = 8, height = 6)
ggsave("hmmer_top_hits.pdf", p2, width = 10, height = 6)
ggsave("hmmer_significance.pdf", p3, width = 10, height = 6)

# Return success message
print("HMMER result analysis complete, 3 plots saved to the current directory")

