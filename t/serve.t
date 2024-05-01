use Test::More;

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
BEGIN { $ENV{SPVM_BUILD_DIR} = "$FindBin::Bin/.spvm_build"; }

use Test::TCP;
use HTTP::Tiny;

use SPVM 'TestCase::HTTP::Tiny';

test_tcp(
    server => sub {
      my $port = shift;
      
      warn $port;
      
      my $cmd = "perl t/webapp/basic.pl daemon --listen http://*:$port ";
      
      exec($cmd);
      
      die "exec failed.";
    },
    client => sub {
      my $port = shift;
      
      my $http = HTTP::Tiny->new;
      
      my $res = $http->get("http://localhost:$port/hello");
      
      like($res->{content}, qr|Hello|);
    }
);

done_testing;
