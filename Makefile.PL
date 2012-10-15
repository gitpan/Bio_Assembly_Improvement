
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Wrapper script for Abacas, just runs it in a separate directory.",
  "AUTHOR" => "Andrew J. Page <ap13\@sanger.ac.uk>",
  "BUILD_REQUIRES" => {
    "Test::Most" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Bio_Assembly_Improvement",
  "EXE_FILES" => [
    "bin/descaffold_assembly",
    "bin/fill_gaps_with_gapfiller",
    "bin/improve_assembly",
    "bin/order_contigs_with_abacas",
    "bin/scaffold_with_sspace"
  ],
  "LICENSE" => "gpl",
  "NAME" => "Bio_Assembly_Improvement",
  "PREREQ_PM" => {
    "Bio::SeqIO" => 0,
    "Cwd" => 0,
    "File::Basename" => 0,
    "File::Copy" => 0,
    "File::Path" => "2.07",
    "File::Temp" => 0,
    "Getopt::Long" => 0,
    "IO::Uncompress::Gunzip" => 0,
    "Moose" => 0,
    "Moose::Role" => 0
  },
  "VERSION" => "20121015.0944",
  "test" => {
    "TESTS" => "t/Abacas/*.t t/FillGaps/*.t t/Overall/*.t t/Scaffold/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



