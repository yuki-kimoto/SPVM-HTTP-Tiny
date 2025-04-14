use strict;
use warnings;

while (my $line = <DATA>) {
  
  chomp $line;
  
  my $method_name = lc $line;
  $method_name =~ s/-/_/g;
  
  my $getter = <<"EOS";
  method $method_name : string (\$name : string) {
    
    my \$values = \$self->{headers_h}->get_string(\$name);
    
    unless (\$values) {
      return undef;
    }
    
    return Fn->join(", ", \$values);
  }
  
EOS

  my $setter = <<"EOS";
  method set_$method_name : void (\$name : string, \$value : string) {
    
    if (\$value) {
      \$self->{headers_h}->set(\$name => [\$value]);
    }
    else {
      \$self->{headers_h}->set(\$name => undef);
    }
  }
  
EOS
  
  print "$getter\n";
  
  print "$setter\n";
  
}

__DATA__
Accept
Accept-Charset
Accept-Encoding
Accept-Language
Accept-Ranges
Access-Control-Allow-Origin
Allow
Authorization
Cache-Control
Connection
Content-Disposition
Content-Encoding
Content-Language
Content-Length
Content-Location
Content-Range
Content-Security-Policy
Content-Type
Cookie
DNT
Date
ETag
Expect
Expires
Host
If-Modified-Since
If-None-Match
Last-Modified
Link
Location
Origin
Proxy-Authenticate
Proxy-Authorization
Range
Sec-WebSocket-Accept
Sec-WebSocket-Extensions
Sec-WebSocket-Key
Sec-WebSocket-Protocol
Sec-WebSocket-Version
Server
Server-Timing
Set-Cookie
Status
Strict-Transport-Security
TE
Trailer
Transfer-Encoding
Upgrade
User-Agent
Vary
WWW-Authenticate
