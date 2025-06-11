**Annotation**
------------------------
RNA-Seq data utilized for genome annotation were obtained from publically available RNA-seq SRR826830 
([PRJNA196857](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA196857) - "RNA sequencing of 15 genomes of Anopheles") 
generated from Illumina PE sequencing of cDNA (HiSeq 2000). Genomic annotation was generated with the Ensembl gene annotation pipeline [7].
Transcript models are supported by RNA-seq experimental evidence. Gene model layering was supported with protein-to-genome alignment of previously 
generated protein models from *A. atroparvus* assembly version [GCA\_000473505.1](https://metazoa.ensembl.org/Anopheles_atroparvus/Info/Index?db=core) 
along with experimentally verified proteins obtained from closely related Hexapoda species - (Uniprot, April 2021). The Ensembl Gene Annotation 
pipeline implemented transcript consensus filtration to remove unsupported alternate transcript isoforms.

Small ncRNAs were obtained using a combination of BLAST and Infernal/RNAfold[8]. Pseudogenes were calculated by examining genes with a large 
percentage of non-biological introns (introns of <10bp), where the gene was covered in repeats, or where the gene was single exon and evidence 
of a functional multi-exon paralog was found elsewhere in the genome. 

lncRNAs were generated via RNA-seq data where no evidence of protein homology or protein domains could be found in the transcript.

For in-depth overview of the Gene Annotation pipeline see detailed information [here](https://www.ensembl.org/info/genome/genebuild/index.html).
