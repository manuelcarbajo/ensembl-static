### Annotation

Transcript assemblies (TAs) were made from 414M paired-end reads by PERTRAN. 
TAs and ESTs were further assembled into PASA transcript assemblies (46,382), 
and 185,671 TAs and ESTs into sibling PASA transcript assemblies (62,501) by PASA. 
Loci were determined by PASA transcript assembly alignments and/or EXONERATE alignments 
of proteins from *Arabidopsis thaliana*, rice, sorghum, mimulus, grape, *Phalaenopsis 
equestris* and Swiss-Prot proteomes to the repeat-soft-masked genome sequence up to 2 Kbp 
extension on both ends unless extending into another locus on the same strand. 

Gene models were predicted by homology-based predictors (FGENESH+, FGENESH_EST, GenomeScan). 
The best scored predictions for each locus were selected using multiple positive factors 
including EST and protein support, and one negative factor: overlap with repeats. 
The selected gene predictions were improved by PASA considering UTRs, splicing corrections 
and alternative transcripts. PASA-improved gene model proteins were subject to protein homology analysis to above mentioned proteomes to obtain Cscore and protein coverage. Cscore is a protein BLASTP score ratio to MBH (mutual best hit) BLASTP score and protein coverage is highest percentage of protein aligned to the best of homologs. PASA-improved transcripts were selected based on Cscore, protein coverage, EST coverage, and its CDS overlapping with repeats. The transcripts were selected if its Cscore is larger than or equal to 0.5 and protein coverage larger than or equal to 0.5, or it has EST coverage, but its CDS overlapping with repeats is less than 20%. For gene models whose CDS overlaps with repeats for more than 20%, its Cscore must be at least 0.9 and homology coverage at least 70% to be selected. The selected gene models were subject to Pfam and Panther analysis and gene models whose protein is more than 30% in Pfam/Panther TE domains were removed.

Repeats were annotated with the [Ensembl Genomes repeat feature pipeline](http://ensemblgenomes.org/info/data/repeat_features). There are: 474,588 Low complexity (Dust) features, covering 29 Mb (11.4% of the genome); 66,721 RepeatMasker features (with the nrTEplants library), covering 21 Mb (8.1% of the genome); 108126 Tandem repeats (TRF) features, covering 10 Mb (4.0% of the genome); Repeat Detector repeats length 90Mb (35.3% of the genome).
