### Annotation

The *Vigna radiata* genome gene prediction was implemented using the
MAKER pipeline by [Seoul National
University](http://europepmc.org/articles/PMC4241982). Transcriptomes of
leaf, flower, pod and root tissues, were sequenced by Illumina Hiseq2000
and assembled using Trinity. De novo transcriptome assemblies were
pooled, and the redundant sequences were removed using CD-HIT. For the
gene prediction pipeline, the transcriptome assembly of V. radiata, the
protein sequences of Glycine max (soybean), and the complete protein
sequences of Arabidopsis thaliana from UniProt were used. Once an
initial prediction was made by the MAKER pipeline, its output results
were used for training AUGUSTUS model parameters for the accuracy of
gene predictions. Using the trained model parameters of *V. radiata*,
the prediction pipeline was re-run against the repeat-masked *V.
radiata* genomic scaffolds. A set of the resulting high-confident genes
was annotated using InterProScan 5. In total, 22,427 genes were
identified with high confidence, and 18,378 genes were located on 11
whole-chromosome pseudomolecules.

Repeated sequences were called with the Repeat Detector, which is part of the [Ensembl Genomes repeat feature pipelines](http://plants.ensembl.org/info/genome/annotation/repeat_features.html). Repeats length: 172359311 - Repeats content: 37.2%
