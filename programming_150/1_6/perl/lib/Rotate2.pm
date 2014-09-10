package Rotate2;
use strict;
use warnings;

use base 'Exporter';
our @EXPORT = qw/rotate/;

sub rotate {
    my ($square) = @_;

    my $array_size = scalar @{$square->[0]};

    for(my $layer = 0; $layer < $array_size / 2; $layer++){

        print " > ================================================ "."\n";

        # 処理範囲の作成
        my $first = $layer;
        my $last  = $array_size - 1 - $layer;

        for(my $i = $first ; $i < $last ; $i++){

            # 処理範囲の始点からどれだけ移動したか
            my $offset = $i - $first;

            # 入れ替え
            my $top = $square->[$first][$i];

            # 左から上へ
            $square->[$first][$i] = $square->[$last - $offset][$first];

            # 下から左へ
            $square->[$last - $offset][$first] = $square->[$last][$last - $offset];

            # 右から下へ
            $square->[$last][$last - $offset] = $square->[$i][$last];

            # 上から右へ
            $square->[$i][$last] = $top;

        }

    }

    return $square;
}

1;

