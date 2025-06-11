*AatrE3* assembly
-----------------

This assembly is a recaffolding of the *AatrE1* assembly using in situ
hybridization of genomic scaffolds and synteny information from the
paper [\"Partial-arm translocations in evolution of malaria mosquitoes
revealed by high- coverage physical mapping of the Anopheles atroparvus
genome\", Artemov et al, BMC
Genomics](https://bmcgenomics.biomedcentral.com/articles/10.1186/s12864-018-4663-4).
The assembly differs from the *Aatre2* version by the inclusion of
spacer sequences between scaffolds, and the presence of a 1MB gap of
chromosome 2L. No sequences have changed, and the order of assembly
components remains the same as *Aaetr2*. In all 201MB (89.6% of the
genome) and 56 scaffolds were anchored to chromosomes, leaving 1,315
scaffolds (10.4% of the genome assembly) unmapped.

The original *Aaetr1* assembly was generated using 101 bp paired-end
Illumina HiSeq2000 reads generated from three libraries: a 180 bp insert
'fragment' library, a 1.5 kb 'jump' library, and a 38 kb 'fosill'
library. Sequencing template for the fragment and jump libraries was
derived from genomic DNA extracted from a single individual, which was
preserved by freezing at -80C. Native genomic DNA was used for the
fragment library and whole genome amplified DNA was used for the jump
library. Template for the fosill library was generated from a pooled
extraction of many individuals. Reads were assembled at the Broad
Institute using the ALLPATHS LG algorithm, with the Haploidify option
enabled to address high allelic heterozygosity in the template.
