This repository replaces the Drupal backend for non-vertebrate static content used on the five divisional websites:

* bacteria.ensembl.org
* fungi.ensembl.org
* metazoa.ensembl.org
* plants.ensembl.org
* protists.ensembl.org

Site homepage content is stored for all divisions, and for all except bacteria, descriptions and annotation information for all species. 

## Species related file naming
Each "leaf" file for the species data should be prefixed with the `species.url` from the core's meta table (*not* a `species.production_name`).

I.e. for `bemisia_tabaci_sweetpotug_core_53_106_1` we have
```
st3 -D bemisia_tabaci_sweetpotug_core_53_106_1 -e 'select meta_key, meta_value from meta where meta_key in ("species.url", "species.production_name")'
meta_key	meta_value
```
```
species.production_name	bemisia_tabaci_sweetpotug
species.url	Bemisia_tabaci_uganda1
```

And we should use `Bemisia_tabaci_uganda1_` as a prefix for the species specific files (see below).

## Referencing images

TODO

## Referencing PMC publication

TODO

## Paths for the species related text(md) files

We suppose files to be put into the directory with the name of this form
`<division>/species/<species_first_name>/<species_first_and_second_names>/<prefix>_<part>`

Part is one of the following:
 * `acknowledgement.html`
 * `about.md`
 * `annotation.md`
 * `assembly.md`
 * `references.md`

N.B. Same directory can be shared by the entities with the different trinomial (production) prefices. 

I.e.
```
metazoa/species/Bemisia/Bemisia_tabaci/Bemisia_tabaci_uganda1_about.md
metazoa/species/Bemisia/Bemisia_tabaci/Bemisia_tabaci_uganda1_acknowledgement.html
metazoa/species/Bemisia/Bemisia_tabaci/Bemisia_tabaci_uganda1_annotation.md
metazoa/species/Bemisia/Bemisia_tabaci/Bemisia_tabaci_uganda1_assembly.md
metazoa/species/Bemisia/Bemisia_tabaci/Bemisia_tabaci_uganda1_references.md
```

## Path to the species specific images
Similar to the md files should be in the form:
`<division>/images/species/<species_first_name>/<prefix>.png`

I.e.
```
metazoa/images/species/Bemisia/Bemisia_tabaci_uganda1.png
```

N.B.
  1. Only `*.png` format is supported
  2. No `<species_first_and_second_names>` used.

Hint for cropping (see ImageMagick for details):
```
convert -crop 500x500+100+100  organism_ch_1.png Clytia_hemisphaerica.png
convert -crop 216x216+0+8 +repage -gravity center Varroa_Mite.jpg Varroa_destructor.png
convert +repage -background black -gravity center -extent 610x610  Clytia-ENSEMBL-2.jpeg Clytia_hemisphaerica.png
convert -crop 385x120+1+10 +repage -background black -gravity center -extent 385x385 hmia_stripes_hor-0.png hmia_stripes_moved.png
convert -crop 1500x850+00+0 -background black -gravity center +repage -extent 1500x1500 -resize 512x512 ensembl_gigas_black.jpg Crassostrea_gigas.png
```


## Path to the general devision specific images
Put it into `<division>/images`.

Not sure if formats matter here.

I.e.
```
metazoa/images/European_Commission.png
metazoa/images/wikipedia_logo_v2_en.png
```

## How to merge.
1. Fork.
2. Clone from the `master` branch.
3. Edit, add, commit to your copy. Push to your copy.
4. Create a PR from your fork to the `master` branch of the source.

