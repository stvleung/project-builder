#!/usr/bin/env perl

use strict;
use Getopt::Long;
use Pod::Usage;
use Time::HiRes qw(sleep);
use File::Path qw(make_path);
use File::Copy qw(copy move);

my @langs;

# Defaults
my $srcdir = './src';
my $outdir = './build';
my ($help, $man);

# Command line options
GetOptions(
  'langs|l=s'   => \@langs,
  'srcdir|s=s'  => \$srcdir,
  'outdir|o=s'  => \$outdir,
  'help|h'      => \$help,
  'man|m'       => \$man,
) || pod2usage(2);

# Print the help or man page if requested
pod2usage(1) if $help;
pod2usage(-exitval => 0, -verbose => 2) if $man;

# Allow for multiple comma-separated arguments
@langs = split(/,/, join(',', @langs));

# Set default for list of languages if none
@langs = ('en', 'es', 'ja', 'ko', 'zh', 'de', 'fr', 'it') unless @langs;

# Do the actual "building"
make_path $outdir unless -d $outdir;
foreach my $lang (@langs) {
  mkdir "$outdir/tmp";

  # There's a temporary location where this gets built
  copy("$srcdir/$lang.js", "$outdir/tmp/tmp.js");

  # This is random! You don't know how long it's going to take!
  sleep(2 + rand);

  # Save the built file into place
  move("$outdir/tmp/tmp.js", "$outdir/$lang.js");

  # Remove evidence
  rmdir "$outdir/tmp";
}

__END__

=head1 NAME

builder.pl - "builds" source files into built assets

=head1 SYNOPSIS

builder.pl [options]

  Options:
    -l,--langs=en,es      Provide list of languages to build.
                          default: builds all the langauges if not specified
    -s,--srcdir=./src     Specify the source directory. default: ./src
    -o,--outdir=./build   Specify the output directory. default: ./build
    -h,--help             Prints a short help page with usage
    -m,--man              Shows the full documentation

=head1 OPTIONS

=over 4

=item B<-l,--langs>

Provide a list of langauges to build

Eg.
    builder.pl --langs=en,es  # builds en and es
    builder.pl --langs=es     # builds only es

=item B<-s,--srcdir>

Specify the source directory.

The default is: ./src

=item B<-o,--outdir>

Specify the output directory.

The default is: ./build

=item B<-h,--help>

Prints a short help page with usage

=item B<-m,--man>

Shows the full documentation

=back

=head1 DESCRIPTION

B<builder.pl> builds the source files into build assets.

Essentially does nothing but takes 10 seconds to do so :-)

=cut
