package Compress;

use strict;
use warnings;

use base 'Exporter';
our @EXPORT = qw/compress/;

sub compress {
    my $str = shift;

    return 0 unless $str;

    my @array  = split //, $str;
    my $char   = $array[0];
    my $cnt    = 1;
    my $result = "";

    for ( my $i = 1 ; $i <= scalar @array ; $i++ ){

        if ( defined($array[$i]) && $char eq $array[$i]) {
           $cnt++;
           next;
       }

       $result = $result.$char.$cnt;
       $char = $array[$i];
       $cnt = 1;

    }

    return $result;
}

1;
