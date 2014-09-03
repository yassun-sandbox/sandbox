package Permtation;

use strict;
use warnings;
use utf8;

use base 'Exporter';
our @EXPORT = qw/permtation/;

sub permtation {
   my ($str1,$str2) = @_;

   return 0 unless $str1 || $str2;
   return 0 if length($str1) != length($str2);

   my @array1 = split //, $str1;
   my @array2 = reverse(split //, $str2);

   for ( my $i = 0 ; $i < scalar @array1 ; $i++ ){
       return 0 if $array1[$i] ne $array2[$i];
   }

   return 1;
}

1;

