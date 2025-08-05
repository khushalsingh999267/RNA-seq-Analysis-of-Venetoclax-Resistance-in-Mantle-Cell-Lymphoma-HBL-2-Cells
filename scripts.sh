
#################################     SCRIPT FOR TRIMGLORE    ################################

#!/bin/bash

in_dir="/nobackup/biol5178M/group1"
out_dir="/home/home02/vmtk5639/myproject/trimmed_read"

mkdir -p "$out_dir"

for sample in "$in_dir"/*.fastq.gz; do
base=$(basename "$sample" .fastq.gz)
/nobackup/leedsomics_tools/TrimGalore-0.6.6/trim_galore \
--quality 20 \
--length 36 \
--cores 14 \
--output_dir "$out_dir" \
"$sample" &
done
wait




#################################     SCRIPT FOR SALMON INDEXING ################################



#!/bin/bash 
dir="/home/home02/vmtk5639/myproject/salmon/salmon_reference"
mkdir -p "$dir"

# Download transcriptome
wget -P "$dir" https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_44/gencode.v44.transcripts.fa.gz

# Build index
/nobackup/leedsomics_tools/salmon-latest_linux_x86_64/bin/salmon index \
-t "$dir/gencode.v44.transcripts.fa.gz" \
-i "$dir/salmon_index" \
--threads 14





