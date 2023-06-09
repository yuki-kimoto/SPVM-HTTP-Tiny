use 5.008_007;
use ExtUtils::MakeMaker;
use strict;
use warnings;
use Config;
use Getopt::Long 'GetOptions';

GetOptions(
  'meta' => \my $meta,
  'no-build-spvm-classes' => \my $no_build_spvm_classes,
);

if ($meta) {
  $no_build_spvm_classes = 1;
}

unless ($meta) {
  # Do something such as environment check.
}

my $version_string = &get_version_string('lib/SPVM/HTTP/Tiny.spvm');

my %configure_and_runtime_requires = ('SPVM' => '0.9706');
WriteMakefile(
  NAME              => 'SPVM::HTTP::Tiny',
  VERSION           => $version_string,
  LICENSE           => 'mit',
  ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
    (ABSTRACT_FROM  => 'lib/SPVM/HTTP/Tiny.pm',
     AUTHOR         => 'USER_NAME<USER_MAIL>') : ()),
  test => {TESTS => 't/*.t t/*/*.t t/*/*/*.t'},
  clean => {FILES => ['.spvm_build', 't/.spvm_build']},
  META_MERGE => {
    'meta-spec' => { version => 2 },
    resources => {
      repository => {
        type => 'git',
        url  => '',
        web  => '',
      },
    },
    no_index => {
      directory => [],
    }
  },
  NORECURS => 1,
  CONFIGURE_REQUIRES => {
    %configure_and_runtime_requires,
  },
  PREREQ_PM         => {
    %configure_and_runtime_requires,
    'SPVM::IO' => '0.20',
    'Time::Local' => '0.10',
    'SPVM::Sys' => '0.481003',
  },
  TEST_REQUIRES => {
    
  },
);

sub MY::postamble {

  my $make_rule = '';
  
  unless ($no_build_spvm_classes) {
    require SPVM::Builder::Util::API;
    
    
    
  }
  
  return $make_rule;
}

sub get_version_string {
  my ($spvm_class_file) = @_;
  
  open my $spvm_class_fh, '<', $spvm_class_file or die "Can't open the file \"$spvm_class_file\": $!";
  local $/;
  my $content = <$spvm_class_fh>;
  my $version_string;
  if ($content =~ /\bversion\s*"([\d\._]+)"\s*;/) {
    $version_string = $1;
  }
  
  return $version_string;
}

1;
