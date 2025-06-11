#!/usr/bin/env perl
# Copyright [2020-2022] EMBL-European Bioinformatics Institute
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#      http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

use strict;
use warnings;
use Getopt::Std;
use File::Copy;
use FindBin '$Bin';

# Creates new folder with markdown drafts for a species static content.
# By default .md files are copied from templates, but other 
# existing species can be used as well.
# Resulting files are placed in CWD.
#
# Example call:
#
# perl ensembl-static/scripts/make_new_species.pl -n Persea_americana -v -r
#
# or when you want to copy from a previous species:
#
# perl ensembl-static/scripts/make_new_species.pl -n Camelina_sativa -c Beta_vulgaris

my $TEMPLATEDIR = $Bin.'/../templates/';
my @NVDIVISIONS = qw( plants fungi metazoa plants protists );
my @DEFAULT = qw( about assembly annotation references );
my @OPTIONAL = qw( other regulation variation acknowledgement );

##############################################################

my ($spname,$copy,$do_var,$do_reg,$do_ack,$do_others) = ('','',0,0,0,0);
my (@sections,%opts,$section,$source_path,$bk_path,$path);

getopts('n:c:vraoh', \%opts);

if($opts{'h'} || scalar(keys(%opts))==0) {
  print "\nusage: $0 [options]\n\n";
  print "-h this message\n";
  print "-n name of new species        (required, example: -n Genus_species)\n";
  print "-c copy files from species    (optional, example: -c Arabis_alpina)\n";
  print "-v add variation file         (optional)\n";
  print "-r add regulation file        (optional)\n";
  print "-a add acknowledgments file   (optional)\n";
  print "-o add other file             (optional)\n\n";
  exit(0);
}

## parse parameters 
if($opts{'n'}){
  $spname = $opts{'n'};

  # validate species names
  
  # 1st char should be in capitals
  if($spname !~ /^[A-Z]/){
    $spname = ucfirst($spname);
  }

  # binomial or trinomial only
  my $num_name_words = 0;
  while($spname =~ /[^_]+_*/g){
    $num_name_words++;
  }

  if($num_name_words < 2){
    die "# ERROR: please use a binomial or trinomial species name\n";
  }

  # set default source_path, which is also backup 
  $source_path = $TEMPLATEDIR;
  $bk_path = $TEMPLATEDIR;

  # add default sections
  @sections = @DEFAULT;

} else { die "# ERROR: please set specie name with -n\n" }

if($opts{'c'}){
  $copy = $opts{'c'};
  
  # check copy species actually exits
  my @files;
  foreach my $div (@NVDIVISIONS){

    # find file among all division files
    $path = $Bin."/../$div/species";
    opendir(DIV,$path) || die "# ERROR: cannot list $path\n";
    @files = grep {/^$copy/i} readdir(DIV);	
    closedir(DIV);
  
    if(@files){ 
	
      # make sure only one species matches 	
      if(scalar(@files) > 1){
        die "# ERROR: matched several species to copy: ".join(',',@files)."\n";        
      }

      # save source path
      $source_path = "$path/$files[0]/";
	  last;
	}
  }
}

print "# source: $source_path*\n";

# add optional files/section of static content
foreach $section (@OPTIONAL){
  if( ($section eq 'variation' && $opts{'v'}) || 
      ($section eq 'regulation' && $opts{'r'}) ||
      ($section eq 'other' && $opts{'o'}) ||
      ($section eq 'acknowledgements' && $opts{'a'}) ){

    push(@sections, $section);
  }
}

# create new folder
mkdir("$spname");

# actually create new .md files from source templates
foreach $section (@sections){

  # warn if target file exists
  if(-s "$spname/$spname\_$section.md"){
    print "# file $spname/$spname\_$section.md already exists, skip it\n";
	next;
  }
  
  if($copy && -e "$source_path/$copy\_$section.md"){
    copy("$source_path/$copy\_$section.md", "$spname/$spname\_$section.md")
  } else {
    copy("$bk_path$section.md", "$spname/$spname\_$section.md")
  }
}

