package SetZeros;
use strict;
use warnings;

use base 'Exporter';
our @EXPORT = qw/set_zeros/;

sub set_zeros {
    my $array_ref = shift;

    my $array_size = scalar @{$array_ref->[0]};

    my @row    = (0) x $array_size;
    my @column = (0) x $array_size;

    for (my $i = 0 ; $i < $array_size; $i++){
        for (my $j = 0 ; $j < $array_size; $j++){
            next if( $array_ref->[$i][$j] ne '0' );
            $row[$i]    = 1;
            $column[$j] = 1;
        }
    }

    for (my $i = 0 ; $i < $array_size; $i++){
        for (my $j = 0 ; $j < $array_size; $j++){
            if( $row[$i] == 1 || $column[$j] == 1){
                $array_ref->[$i][$j] = 0;
            }
        }
    }

    return $array_ref;
}

1;
