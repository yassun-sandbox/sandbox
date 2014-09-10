use strict;
use warnings;

use Test::More;
use Rotate2;

subtest '1 ✕ 1' => sub {

    my $square_ref = [[qw/A/]];
    my $ok_ref     = [[qw/A/]];

    is_deeply rotate($square_ref) ,$ok_ref;
};

subtest '3 ✕ 3' => sub {

    my $square_ref = [[qw/A B C/],[qw/A B C/],[qw/A B C/]];
    my $ok_ref     = [[qw/A A A/],[qw/B B B/],[qw/C C C/]];

    is_deeply rotate($square_ref) ,$ok_ref;
};

subtest '5 ✕ 5' => sub {

    my $square_ref = [[qw/A B C D E/], [qw/A B C D E/],[qw/A B C D E/],[qw/A B C D E/],[qw/A B C D E/]];
    my $ok_ref     = [[qw/A A A A A/],[qw/B B B B B /],[qw/C C C C C/],[qw/D D D D D/],[qw/E E E E E/]];

    is_deeply rotate($square_ref) ,$ok_ref;
};
done_testing();

