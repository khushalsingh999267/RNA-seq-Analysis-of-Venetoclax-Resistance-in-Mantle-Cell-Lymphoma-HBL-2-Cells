# RNA-seq-Analysis-of-Venetoclax-Resistance-in-Mantle-Cell-Lymphoma-HBL-2-Cells
This project explores the transcriptional changes associated with acquired resistance to the BCL2 inhibitor Venetoclax (ABT‑199) in a mantle cell lymphoma cell line (HBL‑2). By comparing RNA‑seq data from parental (sensitive) and drug‑resistant cells, we identify DEG and enriched biological processes to shed light on resistance mechanisms.

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

## Results & Interpretation

* Identified \~X up‑regulated and \~Y down‑regulated genes in resistant vs. sensitive cells.
* Key hits include *BCL2*, *MCL1*, and pathways related to apoptosis and mitochondrial function.
* GO terms for "programmed cell death" and "mitochondrial organization" were significantly enriched, suggesting adaptive survival mechanisms.

## License

This project is released under the MIT License. See [LICENSE](LICENSE) for details.

## Contact

Khushal ([khushal@university.edu](mailto:khushal@university.edu)) — for questions or collaborations.
