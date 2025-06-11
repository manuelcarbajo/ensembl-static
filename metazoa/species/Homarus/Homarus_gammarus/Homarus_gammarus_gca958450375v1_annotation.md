**Annotation**
----------

The annotation presented is derived from annotation submitted to
[INSDC](http://www.insdc.org) with the assembly accession [GCA\_958450375.1](http://www.ebi.ac.uk/ena/data/view/GCA_958450375.1).

Transcript models are supported by RNA-seq experimental evidence. Including publicly available illumina transcriptome data of genus:*Homarus* (n=107), genomic annotation also utilized forty transcriptomic libraries from multiple developmental and tissue specific samples of *Homarus gammarus* generated for this purpose PRJEB50279.

Gene model layering was supported with protein-to-genome alignment with experimentally verified proteins [PE evidence level 1, 2] obtained from Crustacea - (Uniprot, March 2022). The Ensembl Gene Annotation pipeline implemented transcript consensus filtration to remove unsupported alternate transcript isoforms.

Most ncRNAs are annotated by aligning genomic sequence against [RFAM](https://rfam.org/) using [BLASTN](http://blast.wustl.edu/). Pseudogenes were calculated by examining genes with a large percentage of non-biological introns (introns of <10bp), where the gene was covered in repeats, or where the gene was single exon and evidence of a functional multi-exon paralog was found elsewhere in the genome. tRNAs are annotated as part of the raw compute process using [tRNAscan-SE](http://lowelab.ucsc.edu/tRNAscan-SE/)

lncRNAs were generated via RNA-seq data where no evidence of protein homology or protein domains could be found in the transcript.

For in-depth overview of the Ensembl Gene Annotation pipeline see detailed information [here](https://www.ensembl.org/info/genome/genebuild/index.html).


