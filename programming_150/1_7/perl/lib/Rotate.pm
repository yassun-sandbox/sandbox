package Rotate;
use strict;
use warnings;

use base 'Exporter';
our @EXPORT = qw/rotate/;

sub rotate {
    my ($square) = @_;

    my $array_size = scalar @{$square->[0]};
    my @result;
    for (my $i = 0;$i < $array_size; $i++){

        my @work;
        for(my $j = 0; $j < $array_size; $j++){
            push @work, $square->[$j][$i];
        }

        push @result, \@work;
    }

    return \@result;

}

1;

