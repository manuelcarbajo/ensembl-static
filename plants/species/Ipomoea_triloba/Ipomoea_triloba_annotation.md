### Annotation

AUGUSTUS (v3.1) was trained on the soft-masked assemblies using leaf
RNA-Seq alignments. Gene models were then predicted using the
hard-masked assemblies and refined with PASA2 (v2.0.2) using
genome-guided transcript assemblies as evidence. A high-confidence gene
model set was constructed from the working gene model set by removing
partial gene models and gene models with an internal stop codon, a hit
to a\
transposable element, or an FPKM of 0 across the RNA-Seq libraries.
**NOTE:** Genes in Chr16 actually correspond to gene models in the
concatenated unanchored scaffolds.

Repeats were annotated with the [Ensembl Genomes repeat feature
pipeline](http://plants.ensembl.org/info/genome/annotation/repeat_features.html). There
are: 902670 Low complexity (Dust) features, covering 57 Mb (12.3% of the
genome); 191219 RepeatMasker features (with the REdat library), covering
48 Mb (10.3% of the genome); 24460 RepeatMasker features (with the
RepBase library), covering 3 Mb (0.6% of the genome); 441020 Tandem
repeats (TRF) features, covering 54 Mb (11.7% of the genome);
Repeat Detector repeats length 178Mb (38.7% of the genome).
