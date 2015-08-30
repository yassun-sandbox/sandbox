use strict;
use warnings;
use Test::More;
use SetZeros;


subtest '正常系のテスト' => sub {

    my $square_ref = [[qw/A B C D E/],[qw/A B C 0 E/],[qw/A 0 C D E/],[qw/A B C D E/],[qw/A B C D E/]];
    my $ok_ref     = [[qw/A 0 C 0 E/],[qw/0 0 0 0 0/],[qw/0 0 0 0 0/],[qw/A 0 C 0 E/],[qw/A 0 C 0 E/]];

    is_deeply set_zeros($square_ref), $ok_ref;

};


done_testing();

