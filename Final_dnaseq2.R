# Load required libraries
library(tximport)
library(DESeq2)
library(pheatmap)
library(ggplot2)
library(ggrepel)
library(dplyr)
library(apeglm)
library(org.Hs.eg.db)
library(enrichGO)


# File paths for the 6 quant.sf files
files <- c(
  "/media/khushal/Acer/Bioinformatics/Salmon_Quant_Files/venetoclax-rna-seq-pipeline/data/trimmed/SRR7407832_trimmed_quant/quant.sf",
  "/media/khushal/Acer/Bioinformatics/Salmon_Quant_Files/venetoclax-rna-seq-pipeline/data/trimmed/SRR7407833_trimmed_quant/quant.sf",
  "/media/khushal/Acer/Bioinformatics/Salmon_Quant_Files/venetoclax-rna-seq-pipeline/data/trimmed/SRR7407834_trimmed_quant/quant.sf",
  "/media/khushal/Acer/Bioinformatics/Salmon_Quant_Files/venetoclax-rna-seq-pipeline/data/trimmed/SRR7407805_trimmed_quant/quant.sf",
  "/media/khushal/Acer/Bioinformatics/Salmon_Quant_Files/venetoclax-rna-seq-pipeline/data/trimmed/SRR7407806_trimmed_quant/quant.sf",
  "/media/khushal/Acer/Bioinformatics/Salmon_Quant_Files/venetoclax-rna-seq-pipeline/data/trimmed/SRR7407807_trimmed_quant/quant.sf"
)

# Sample names corresponding to the files
names(files) <- c("SRR7407832", "SRR7407833", "SRR7407834", "SRR7407805", "SRR7407806", "SRR7407807")

# Load the tx2gene file
tx2gene <- read.csv("/media/khushal/Acer/Bioinformatics/Salmon_Quant_Files/venetoclax-rna-seq-pipeline/reference/tx2gene.gencode.v46.csv", stringsAsFactors = FALSE)

# Import transcript-level quantifications and aggregate to gene-level counts
txi <- tximport(files, type = "salmon", tx2gene = tx2gene, ignoreAfterBar = TRUE)

# Inspect the imported counts
head(txi$length)
head(txi$abundance)
head(txi$counts)
head(txi$countsFromAbundance)

# Define sample metadata
sample_conditions <- data.frame(
  row.names = names(files),
  condition = c("Parent", "Parent", "Parent", "Derived", "Derived", "Derived")
)

# Create a DESeq2 dataset
dds <- DESeqDataSetFromTximport(txi, colData = sample_conditions, design = ~condition)

dds <- dds[rowSums(counts(dds)) > 20, ]

# Perform DESeq2 analysis
dds <- DESeq(dds)
res = results(dds)

#Shrinkage logfold



res <- lfcShrink(dds, coef = "condition_Parent_vs_Derived",type = "apeglm")

#MA Plot
plotMA(res,ylin=c(-5,5),main="MA without Shrinkage")

#PCA
vsd <- vst(dds,blind = FALSE)
plotPCA(vsd,intgroup="condition")

#Volcano Plot
res_df <- as.data.frame(res)
res_df <- res_df %>% mutate(
  label = ifelse(
    padj < 0.05 & log2FoldChange > 1, "Upregulated",
    ifelse(padj < 0.05 & log2FoldChange < -1, "Downregulated", "Not Significant")))


res_df <- res_df %>% arrange(padj)
res_df$gene <- rownames(res_df)

res_df = res_df %>% mutate(GeneID = gsub("\\..*","",gene))


res_df$gene_name <- mapIds(org.Hs.eg.db, keys = res_df$GeneID,
                        column = "SYMBOL", keytype = "ENSEMBL", multiVals = "first")


########### VISUALIZATIONS #############
#Counting number of regulated and unregulated genes

boxplot(res_df$log2FoldChange)
logfold_summarise = res_df %>% split(log2FoldChange) %>% summarise(
  mean_fold = mean(log2FoldChange),
  max_fold= max(log2FoldChange),
  min_fold=min(log2FoldChange),
  count=n()
)

 
## Volcano plot to highlights significantly upregulated and downregulated genes ##
volcano_plot=ggplot(res_df, aes(x = log2FoldChange, y = -log10(padj), color = label)) +
  geom_point(alpha = 0.8) +
  scale_color_manual(values = c("Upregulated" = "red", "Downregulated" = "blue", "Not Significant" = "gray")) +
  labs(
    title = "Volcano Plot of Differential Expression",
    x = "Log2 Fold Change",
    y = "-Log10 Adjusted P-Value") +
  geom_text_repel(data=res_df %>% filter(Significance=="Significant") %>% 
              slice(1:10),
            aes(label = gene_name),size = 4,vjust=1.5)+
  theme_minimal() +
  theme(legend.title = element_blank()) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "black")

ggsave(
    filename = "volcano_plot.png",plot = volcano_plot, width = 16,height = 9)
  
ggplot(res_df,aes(x=log2FoldChange,y=-log10(pvalue),color=Significance))+
  geom_point(alpha=0.2,size=2)+
  geom_text_repel(data=res_df %>% filter(Significance=="Significant") %>% 
              slice(1:10),
            aes(label = gene),size = 3,vjust=1.5)


# Convert DESeq2 results to a data frame and add row names as a new column
res <- as.data.frame(results(dds))

res$gene <- rownames(res)  # Add gene names as a column




# Enhanced MA plot
ggplot(res_df, aes(x = baseMean, y = log2FoldChange, color = Significance)) +
  geom_point(alpha = 0.4, size = 1.5) +
  scale_x_log10() +
  scale_color_manual(values = c("Not Significant" = "gray",
                                "Significant" = "blue")) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
  geom_text(data = res_df %>% filter(gene %in% top_genes),
            aes(label = gene), size = 3, vjust = 1.5) +
  labs(title = "MA Plot",
       x = "Mean of Normalized Counts (log scale)",
       y = "Log2 Fold Change",
       color = "Gene Expression") +
  theme_minimal() +
  theme(legend.position = "top")




####################### GO Analysis  #########################




res_df = res_df %>% mutate()
significant_genes = res_df %>%
  filter(padj<0.05, abs(log2FoldChange)>1)%>%
  pull(GeneID)

go_results = enrichGO(
  gene = significant_genes,
  OrgDb=org.Hs.eg.db,
  keyType = "ENSEMBL",
  ont="BP",
  pAdjustMethod="BH",
  pvalueCutoff =0.05,
  readable =TRUE
)

library(enrichplot)

dotplot(go_results, showCategory = 10) +
  ggtitle("GO Enrichment Analysis: Biological Processes")

barplot(go_results, showCategory = 10) +
  ggtitle("Top Enriched GO Terms")

cnetplot(go_results, showCategory = 5) +
  ggtitle("GO Term Network")

emapplot(go_results) +
  ggtitle("Enrichment Map of GO Terms")


