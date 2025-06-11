Assembly
--------

The genome of a single female Pacific oyster (*Crassostrea gigas*) from a commercial oyster hatchery (Guernsey Sea Farms, United Kingdom) was sequenced and assembled[1].

DNA was isolated from gill tissue. Genome sequencing was performed on (i) a PacBio Sequel system at \~70 x coverage and (ii) an Illumina HiSeq X platform to a mean coverage of \~50 x. The oyster genome was assembled from PacBio reads using Canu v1.8 and then error corrected using Arrow v2.3.2 and Pilon v1.2.3.

The initial Canu-assembly was substantially larger than expected (\~1.2 Gb), likely due to the high levels of heterozygosity present in the genome of *C. gigas*. Highly divergent haplotypes were identified among the contigs and reassigned with a combination of the Purge Haplotigs pipeline and an all-versus-all contig mapping approach.

The haploid version of the assembly was scaffolded using Hi-C sequence reads and integrated with a previously published linkage map (\~20K SNPs), resulting in a chromosome-level assembly comprising ten large scaffolds (2n = 20 in *C. gigas*). Scaffolds with a high fraction of regions (>30%) showing abnormal coverage (i.e. 2SD above or below the mean) were removed from the assembly.

The final *cgigas_uk_roslin_v1* genome assembly (647.9 Mb) contains the ten expected chromosomes and 226 unplaced scaffolds, with a total N50 of 58.5 Mb and 1.6 Mb for scaffold and contig lengths, respectively.
