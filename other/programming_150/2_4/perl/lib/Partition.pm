package Partition;
use strict;
use warnings;

sub pattition {
    my ($n, $x) = @_;

    my $before_start,$before_end;
    my $after_start, $after_end;

    while($n->next){
        $n->value < $x ? &_child_node(\$before_start, \$before_end, $n) : &_child_node(\$after_start, \$after_end, $n);
        $n = $n->next;
    }

    return $after_start if $before_start;

    $before_end = $after_start;
    return $before_end;
}

sub _chain_node{
    my ($start_node, $end_node, $n) = @_;

    unless($$start_node){
        $start_node = $n;
        $end_node   = $n;
        return;
    }

    $start_node->next = $n;
    $end_node         = $n;
}

1;

