### Annotation

Illumina and 454 RNA-Seq reads totaling 62 Gb were collected from leaf,
pistil and bean tissues, assembled with de-novo RNA assemblers
[Velvet/Oases](http://europepmc.org/abstract/MED/22368243),
[SOAPdenovo-Trans](http://europepmc.org/abstract/MED/24532719), Roche
Newbler, and genome-guided assembler
[Cufflinks](http://europepmc.org/abstract/MED/20436464). From this
over-assembly of 1.2 million transcripts, the 48,404 most accurate cacao
gene assemblies are selected with homology and genome map evidence
scoring.

Proteins from 297,061 genes of eight plants, arabidopsis, poplar,
castorbean, grape, strawberry, potato, soybean, and sorhgum are used for
homology evidence. Transposons were annotated as class I retrotransposon
and II DNA transposon with subcategories, totaling 8,542 intact
transposons with 122,552 copies, covering 137 Mb or 42% of genome
assembly. Gene evidence from RNA mapped introns, plant species protein
homology, expressed RNA alignments, transposons, is mapped to genome
with [GMAP/GSNAP](http://europepmc.org/abstract/MED/15728110), tBLASTn,
and [exonerate](http://europepmc.org/abstract/MED/15713233). Several
genome gene prediction sets were produced with
[AUGUSTUS](http://europepmc.org/abstract/MED/16469098), following HMM
training of this predictor on cacao transcripts, by varying proportions
of this gene evidence and parameters.

[EvidentialGene](http://arthropods.eugenes.org/EvidentialGene/) software
is used to annotate, score and classify gene assemblies and models with
weighted evidence scores. This includes heuristics to identify and
reduce gene-joins and fragment models. Highest evidence-scored models or
assemblies are selected per locus for a primary transcript. Alternate
transcripts are selected from remaining transcript assemblies (but not
predictions) that vary from primary transcript in exon-intron structure.
The resulting gene set is annotated with reciprocal best BLASTP to
several plant gene sets, clustered to gene families with
[OrthoMCL](http://europepmc.org/abstract/MED/12952885), and annotated
with family consensus function names, homology scores and references,
and other gene quality scores.

This gene set was produced by Don Gilbert (Indiana University).
