package DeleteDups1;

use strict;
use warnings;

use base 'Exporter';
our @EXPOTE = qw/delete_dups/;

sub delete_dups {
    my $n = shift;

    my %hash;
    my $pre;

    while($n != undef){
        my $data = $n->{data};

        if (exists($hash{$data})){
            # 削除
            $pre->{next} = $n->{next};
        }else{
            $hash{$data} = 1;
            $pre = $n;
        }
        $n = $n->{next};
    }

}

1;
