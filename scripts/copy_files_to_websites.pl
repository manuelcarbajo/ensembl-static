#!/usr/bin/perl 
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
use FindBin qw($Bin);
use File::Path;
use File::Basename qw( dirname );
use Getopt::Long;
use Pod::Usage;

=head1 USAGE

Dryrun copy everything to live:

copy_files_to_websites.pl --release=101-48 --site=live --dryrun

Copy everything to staging:

copy_files_to_websites.pl --release=101-48 --site=staging

Copy plants species content only to your local checkout (ensembl-static must be at same level as eg-web-plants):

copy_files_to_websites.pl --release=101-48 --division=plants --species-only

=cut

my ($SCRIPT_ROOT, $help, $auto, $version, $release, $site, $division, $home_only, $species_only);
our ($dryrun, $verbose);

BEGIN{
  &GetOptions(
              'help|h'          => \$help,
              'verbose|v'       => \$verbose,
              'dryrun|d'        => \$dryrun,
              'auto|a'          => \$auto,
              'release|r=s'     => \$release,
              'site:s'          => \$site,
              'division|div:s'  => \$division,
              'home-only:s'     => \$home_only,
              'species-only:s'  => \$species_only,
  );

  pod2usage(1) if $help;

  $SCRIPT_ROOT = dirname( $Bin );
}

my ($version, $eg_version) = split('-', $release);

unless ($version && $eg_version) {
  die "Please provide an Ensembl version and an NV release number, separated by a hyphen, e.g. '--release=101-48'.\n";
}

## Default to all divisions
my @divisions = $division ? ($division) : qw(bacteria fungi metazoa plants protists);

## Set destination - defaults to local checkout(s) in same directory as this repo
my ($OUT_ROOT, $OUT_DIR);

if ($site) {
  if ($site !~ /staging|test|live|debug/) {
    die "Valid destinations are: staging, test, live, debug. Note that 'test' is treated as a synonym for 'live' in the current setup .\n";
  }
  $site = 'live' if $site eq 'test';
  if ($site eq 'debug' && !$division) { 
    print "The debug site defaults to using plants static content.\n";
    @divisions = ('plants');
  }
  $OUT_ROOT = "/nfs/public/release/ensweb/$site";
}
else {
  if (!$division) {
    die "At the moment you can only make a local copy of content for one division at a time. Please specify a division on the command line.\n";
  }
  ($OUT_ROOT = $SCRIPT_ROOT) =~ s#/ensembl-static##;
}

## General warning, as this script is unavoidably noisy!

print "\n\n##################################################\n";
print "\n";
print "\nIMPORTANT NOTE: Ignore any 'cannot stat' or 'omitting directory' messages\n";
print "\nThese are to be expected, as the input is structured differently from the output.\n";
print "\n";
print "\n\n###################################################\n";

## Check that ensembl-static is on same branch as desired eg-version 
## and pull any updates from github
my $branch = sprintf('release/eg/%s', $eg_version);
chdir $SCRIPT_ROOT;
my $cmd = "git checkout $branch && git pull";
if ($dryrun) {
  print "\n Dryrun: Would update this repo using '$cmd'...\n\n";
}
else {
  print "\n Updating static repo: '$cmd'...\n\n";
}
system($cmd) unless $dryrun;

## Define input directories for each type of content
my $home_text_in  = '';
my $home_img_in   = '/images';
my $sp_text_in    = '/species';
my $sp_img_in     = '/images/species';

## Define output directories for each type of content
my $home_text_out = 'htdocs/ssi';
my $home_img_out  = 'htdocs/img';
my $sp_text_out   = 'htdocs/ssi/species';
my $sp_img_out    = 'htdocs/i/species';
my ($input_dir, $output_dir);

foreach my $div (@divisions) {
  
  if ($dryrun) {
    print "\n Dryrun: $div...\n\n";
  }
  else {
    print "\n Copying $div files...\n\n";
  }

  my $div_in_dir     = $SCRIPT_ROOT.'/'.$div;
  my $div_out_dir;
  if ($site) {
    if ($site eq 'debug') {
      ## We only have one debug site for all divisions
      $div_out_dir = sprintf('%s/eg-all/www_%s', $OUT_ROOT, $version);
    }
    else {
      $div_out_dir = sprintf('%s/%s/www_%s', $OUT_ROOT, $div, $version);
    }
  }
  else {
    $div_out_dir = $OUT_ROOT;
  }

  $div_out_dir .= "/eg-web-$div/";

  unless ($auto) {
    print "Copying files into $div_out_dir\nIs this correct? [y/n]\n\n";

    my $response = <STDIN>;
    die "Aborting!\n\n" unless ($response =~ /^y/i); 
  }

  ## The SSI directory is not present in Git, so create it
  my $out_path = $div_out_dir.$home_text_out;
  mkdir($out_path);

  ## Copy home content
  unless ($species_only) {

    print "... home content\n";

    ## Text files
    $input_dir  = $div_in_dir.$home_text_in;
    $output_dir = $div_out_dir.$home_text_out;
    copy_files($input_dir, $output_dir);

    ## Images
    $input_dir  = $div_in_dir.$home_img_in;
    $output_dir = $div_out_dir.$home_img_out;
    copy_files($input_dir, $output_dir);
    print "\n";
  }

  ## Copy species content
  unless ($home_only) {

    print "... species content\n";

    ## Subdirectories also not in Git
    $out_path = $div_out_dir.$sp_text_out;
    mkdir($out_path);
    $out_path = $div_out_dir.$sp_img_out;
    mkdir($out_path);

    ## Text files
    $input_dir  = $div_in_dir.$sp_text_in;
    $output_dir = $div_out_dir.$sp_text_out;
    ## Note that we recurse into subdirectories for this one, as there are a lot of these files!
    copy_files($input_dir, $output_dir, 1);

    ## Images
    $input_dir  = $div_in_dir.$sp_img_in;
    $output_dir = $div_out_dir.$sp_img_out;
    copy_files($input_dir, $output_dir, 1);
    print "\n";
  }

}

sub copy_files {
  my ($in, $out, $recurse) = @_;

  ## Note - do not use -a as we don't want to recurse automatically
  my $cmd = "rsync ";
  $cmd .= $dryrun ? '-n' : '-W';
  $cmd .= 'v' if $verbose;
  $cmd .= " --exclude='deprecated'";

  my $paths = "$in/* $out";
  print "Executing $cmd $paths\n" if $verbose;
  system("$cmd $paths");

  if ($recurse) {
    $paths = "$in/*/* $out";
    print "Executing: $cmd $paths\n" if $verbose;
    system("$cmd $paths");
    $paths = "$in/*/*/* $out";
    print "Executing: $cmd $paths\n" if $verbose;
    system("$cmd $paths");
  }

}

print "\nDone!\n\n";


