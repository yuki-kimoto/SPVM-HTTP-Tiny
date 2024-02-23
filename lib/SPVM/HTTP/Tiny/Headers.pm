package SPVM::HTTP::Tiny::Headers;



1;

=head1 Name

SPVM::HTTP::Tiny::Headers - HTTP Headers

=head1 Description

The HTTP::Tiny::Headers class of L<SPVM> has methods to manipulate HTTP headers.

=head1 Usage

  my $headers = HTTP::Tiny::Headers->new;
  
  $headers->add("Foo", "one value");
  
  my $header_value = $headers->header("Foo");
  
=head1 Class Methods

=head2 new

C<static method new : L<HTTP::Tiny::Headers|SPVM::HTTP::Tiny::Headers> ();>

Creates a new L<HTTP::Tiny::Headers|SPVM::HTTP::Tiny::Headers> object, and returns it.

=head2 Instance Methods

=head2 add

C<method add : void ($name : string, $value : string);>

Adds a header name $name and its value $value.

=head2 remove

C<method remove : void ($name : string);>

Removes a header given its name $name.

=head2 header

C<method header : string ($name : string);>

Gets a header value given its name $name.

=head2 set_header

C<method set_header : void ($name : string, $value : string);>

Set a header value $value given its name $name.

=head2 names

C<method names : string[] ();>

Returns header names.

=head2 to_string

C<method to_string : string ();>

Converts all headers to a string, and returns it.

=head2 clone

C<method clone : HTTP::Tiny::Headers ();>

Clones this headers, and returns it.

=head1 Copyright & License

Copyright (c) 2023 Yuki Kimoto

MIT License

