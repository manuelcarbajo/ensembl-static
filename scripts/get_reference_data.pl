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


# Parses references in .md format and interrogates the $RESTURL 
# (see below) in order to get key data of the corresponding papers, 
# such as journal name, title or EuroPMC citations. 
# Output is TSV format.
#
# Example call: perl ensembl-static/scripts/get_reference_data.pl plants 

use strict;
use warnings;
use FindBin '$Bin';
use JSON;
use HTTP::Tiny;

# see documentation at
# https://europepmc.org/RestfulWebService#!/Europe32PMC32Articles32RESTful32API/search
my $RESTURL = 'https://www.ebi.ac.uk/europepmc/webservices/rest/search';
my $BATCHSIZE = 500;

my @NVDIVISIONS = qw( plants fungi metazoa plants protists );
my $REFREGEX = '(\w{3})/(\d+)';

# check arguments
my $division = '';
if(!$ARGV[0]){
	die "# usage: $0 <division>\n";
} else {
	$division = $ARGV[0];
	if(!grep(/^$division$/,@NVDIVISIONS)){
		die "# ERROR: valid divisions are ".join(',',@NVDIVISIONS)."\n"
	} 
}

# find all division species
my $path = $Bin."/../$division/species";
opendir(DIV,$path) || die "# ERROR: cannot list $path\n";
my @species = readdir(DIV);	
closedir(DIV);
  
# parse all references and work out query
my (@ref_ids,$ref_filename);
foreach my $spname (@species){

	$ref_filename = "$path/$spname/$spname\_references.md";
	if(-s $ref_filename){
		open(REFMD,"<",$ref_filename) ||
			die "# ERROR: cannot read $ref_filename\n";
		while(<REFMD>){
			if(/$REFREGEX/){
				if($1 eq 'MED'){
					push(@ref_ids,"EXT_ID%3A%22$2%22");
				} else {
					push(@ref_ids,"EXT_ID%3A%22$1$2%22");
				}
			}
		}
		close(REFMD);
	}
}

# compose REST query URL
my $url = "$RESTURL?query=(";
$url .= join('%20OR%20',@ref_ids);
$url .= ")&pageSize=$BATCHSIZE&resultType=lite&format=json";

# interrogate REST point (1st time)
my $http = HTTP::Tiny->new();
my $response = 
	$http->get($url, {headers => {'Content-type'=>'application/json'} });
	
die "# ERROR: failed request $url\n" unless $response->{success};

# retrieve results, note that several queries might be needed
my ($nextCursorMark,$hitCount,$current_hits) = ('',0,0);
my ($europmc_data,$nexturl,@results);

$europmc_data = decode_json($response->{content});

$nextCursorMark = $europmc_data->{nextCursorMark};
$hitCount = $europmc_data->{hitCount};

foreach my $ref (@{ $europmc_data->{resultList}{result} }) {

	push(@results, sprintf("%s/%s\t%s\t%s\t%s\t%s\t%s",
		$ref->{source},
		$ref->{id},
		$ref->{pmid} || 'NA',
		$ref->{pmcid} || 'NA',
		$ref->{doi} || 'NA',
		$ref->{journalTitle},
		$ref->{pubYear},
	));

	$current_hits++; 
}

# repeat query with nextCursorMark if required 
while($current_hits < $hitCount){

	$nexturl = "$url&cursorMark=$nextCursorMark";
	$response =
		$http->get($nexturl, {headers => {'Content-type'=>'application/json'} });

	die "# ERROR: failed request $nexturl\n" unless $response->{success};
	
	$europmc_data = decode_json($response->{content});

	# update cursorMark for subsequent calls
	$nextCursorMark = $europmc_data->{nextCursorMark};

	foreach my $ref (@{ $europmc_data->{resultList}{result} }) {

		push(@results, sprintf("%s/%s\t%s\t%s\t%s\t%s\t%s",
			$ref->{source},
			$ref->{id},
	        $ref->{pmid} || 'NA',
	        $ref->{pmcid} || 'NA',
	        $ref->{doi} || 'NA',
	        $ref->{journalTitle},
	        $ref->{pubYear},
	    ));
	    $current_hits++; 
	}
}

# finally print the results
print ";division=$division\n";
print ";id,pmid,pmcid,doi,journalTitle,pubYear\n";
print join("\n",@results);
