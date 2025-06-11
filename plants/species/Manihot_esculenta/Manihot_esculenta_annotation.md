### Annotation

To produce the current [Cassava V6.1 gene
set](https://phytozome.jgi.doe.gov/pz/portal.html#!info?alias=Org_Mesculenta),
the homology-based gene prediction programs FgenesH and GenomeScan were
used, along with the PASA program to integrate expression information
from cassava ESTs and RNA-Seq.

Transcript data from three sources were integrated. First, RNA-seq root
and shoot tissues from Albert and Namikonga varieties, with and without
challenge by CBSV 1x50 (1,055,722,008 initial reads, 895,271,180 reads
after quality trimming) and 2x100 (340,899,946 initial reads;
282,586,400 reads after quality trimming) reads were aligned to the
genome and assembled with phytozome in-house software Pertran. This
yielded 51,588 and 62,488 transcript assemblies from PE and SE reads
respectively. These were aligned to the genome with PASA (90% identity
and 60% coverage cutoffs) to make 69,624 aligned assemblies. In
addition, ESTs from previous 454 sequencing were assembled with Pertran
and added to 80,459 ESTs from GenBank and aligned to the genome with
PASA (95% identity, 60% coverage) to generate 27,470 aligned assembles.

Repeated sequences were called with the Repeat Detector, which is part of the [Ensembl Genomes repeat feature pipelines](http://plants.ensembl.org/info/genome/annotation/repeat_features.html). Repeats length: 245898519 - Repeats content: 42.2%
