package NthToLast;

use strict;
use warnings;

use base 'Exporter';
our @EXPORT = qw/nth_to_last/;

# $n = 対象ノードの先頭 $k = 最端末からの個数 
sub nth_to_last {
    my ($n, $k) = @_;

    # 先頭からk番目のノードを取得する。
    my $last_node = $n;
    for(my $i = 0 ; $i < $k ; $i++){
       $last_node = $last_node->next;
    }

    # 先頭からとk番目のノードを同時に進めていき、
    # k番目のノードが末端に到達した時点のnが目的のノードになる。
    while($last_node->next){
        $n         = $n->next;
        $last_node = $last_node->next;
    }

    return $n;
}

1;

