# RNA-seq-Analysis-of-Venetoclax-Resistance-in-Mantle-Cell-Lymphoma-HBL-2-Cells

## Repository Structure

```
├── data/                  # Reference files (Gencode transcriptome FASTA, tx2gene mapping)
├── scripts/               # Bash pipelines for QC, trimming, and quantification
│   ├── scripts.sh         # Runs FastQC, TrimGalore, and Salmon quantification
│   └── trim.sh            # Adapter trimming with TrimGalore
├── analysis/              # RMarkdown notebooks and R scripts
│   ├── DESeq2_analysis.Rmd # Differential expression workflow using tximport & DESeq2
│   └── GO_enrichment.Rmd   # Gene Ontology over‑representation analysis with clusterProfiler
├── plots/                 # Generated figures (MA‑plots, volcano plots, GO bar charts)
└── README.md              # Project documentation (this file)
```

## What I Did

1. **Data Acquisition & Setup**

   * Retrieved six RNA‑seq FASTQ files (three parental, three resistant) from the HPC arc4 cluster.
   * Prepared directories and environment modules for FastQC, TrimGalore, Salmon, and RStudio.

2. **Quality Control & Adapter Trimming**

   * Wrote `scripts.sh` to submit batch jobs on arc4, running FastQC on each sample to assess read quality.
   * Added `trim.sh` to remove Illumina adapters via TrimGalore (specifying the Cutadapt path).

3. **Transcriptome Quantification**

   * Downloaded Gencode v46 human transcriptome and built a Salmon index.
   * Extended `scripts.sh` to perform quantification on all six samples using Salmon’s selective alignment mode, outputting `quant.sf` files.

4. **Differential Expression Analysis**

   * Transferred `quant.sf` outputs to RStudio and used `tximport` to import counts.
   * Employed the DESeq2 pipeline in `DESeq2_analysis.Rmd` to identify genes with significant expression changes between sensitive and resistant cells.
   * Generated MA‑plots and volcano plots to visualize DE results.

5. **Gene Ontology Enrichment**

   * Used `clusterProfiler` and `org.Hs.eg.db` within `GO_enrichment.Rmd` to perform over‑representation analysis of DE gene sets.
   * Created barplots of top enriched GO terms for up‑ and down‑regulated genes.

## Usage

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/venetoclax-resistance-rnaseq.git
   cd venetoclax-resistance-rnaseq
   ```
2. **Set up tools on HPC**

   * Load FastQC, TrimGalore, Salmon modules (or adjust paths in `scripts/*.sh`).
3. **Run the pipeline**

   ```bash
   cd scripts
   bash scripts.sh    # submits QC, trimming, quantification jobs
   ```
4. **R analyses**

   * Open RStudio, knit `DESeq2_analysis.Rmd` and `GO_enrichment.Rmd` to reproduce figures and tables.

Overall Interpretation & Next Steps
Core Resistance Axis: BCL2/MCL1 over-expression combined with down-regulation of pro-apoptotic PMAIP1.

Transcriptional Rewiring: TCF4, IRF5, IKZF1 emerge as candidate regulators—worth CRISPR or knock-down validation.

Microenvironmental Crosstalk: Enrichment of migration and chemotaxis programs suggests resistant cells may alter their secretome or adhesion to survive; follow up with migration assays or conditioned-media experiments.

BCR Signaling Modulation: Even the B cell receptor pathway is re-programmed—consider testing BCR inhibitors in combination with Venetoclax.

Taken together, the data paint a picture of multi-layered adaptation: anti-apoptotic reinforcement, transcriptional reprogramming, and microenvironmental engagement. This sets up several hypotheses you can test to overcome resistance—e.g. combining Venetoclax with chemokine receptor blockers or BCR pathway inhibitors.

## License

This project is released under the MIT License. See [LICENSE](LICENSE) for details.

## Contact

Khushal ([khushal@university.edu](mailto:khushal@university.edu)) — for questions or collaborations.
