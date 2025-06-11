**Annotation**
------------------------

RNA-Seq data utilized for genome annotation were obtained from publically available RNA-seq. A combination of RNA-Seq from allied species *Phlebotomus papatasi* ([PRJEB35592](https://www.ncbi.nlm.nih.gov/bioproject/PRJEB35592) - "RNA-seq of Phlebotomus papatasi after feeding with blood, and blood containing Leishmania major, Leishmania donovani and Herpetomonas muscarum") and *Phlebotomus chinensis* ([PRJNA471571](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA471571)) - "Transcriptome of Phlebotomus chinensis" was utilized for genomic annotation. Due to data restrictions and specifications of input RNA-Seq read lengths required, no publically available RNA-Seq from *P. perniciosus* was available to use within the Ensembl Annotation pipeline. For in-depth overview of the Gene Annotation pipeline see detailed information [here](https://www.ensembl.org/info/genome/genebuild/index.html).
 
Small ncRNAs were obtained using a combination of BLAST and Infernal/RNAfold[4]. Pseudogenes were calculated by examining genes with a large 
percentage of non-biological introns (introns of <10bp), where the gene was covered in repeats, or where the gene was single exon and evidence 
of a functional multi-exon paralog was found elsewhere in the genome. 

lncRNAs were generated via RNA-seq data where no evidence of protein homology or protein domains could be found in the transcript.
