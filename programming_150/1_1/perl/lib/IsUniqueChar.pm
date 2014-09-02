package IsUniqueChar;

use strict;
use warnings;
use utf8;

use base 'Exporter';
our @EXPORT = qw/isUniqueChar/;

sub isUniqueChar{
    my $str       = shift;
    return 0 unless $str;

    my @work_strs = split //, $str;
    my %work_hash;

    for my $str (@work_strs){
        return 0 if $work_hash{$str};
        $work_hash{$str} = 1;
    }

    return 1;
}

1;

