use Test::More;

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
BEGIN { $ENV{SPVM_BUILD_DIR} = "$FindBin::Bin/.spvm_build"; }

use Test::TCP;
use HTTP::Tiny;

use SPVM 'Int';

my $server = Test::TCP->new(
  code => sub {
    my $port = shift;
    
    # If ">/dev/null 2>&1" does not exists, "make test" waits forever.
    # I do not know this reason by now.
    my $cmd = "perl t/webapp/basic.pl daemon --listen http://*:$port >/dev/null 2>&1";
    
    warn "[Test Output]Server port:$port";
    
    exec($cmd);
    
    die "exec failed.";
  },
);

my $http = HTTP::Tiny->new;

my $port = $server->port;

my $res = $http->get("http://localhost:$port/hello");

like($res->{content}, qr|Hello|);

done_testing;
