use strict;
use warnings;

use Test::More;
use Compress;

subtest '正常系' => sub {

    subtest 'abbcccdddd' => sub {
        is compress("abbcccdddd"), "a1b2c3d4";
    };

    subtest 'a' => sub {
        is compress("a"), "a1";
    };

    subtest 'ab' => sub {
        is compress("ab"), "a1b1";
    };

    subtest 'aa' => sub {
        is compress("aa"), "a2";
    };

    subtest '数値：1' => sub {
        is compress("1"), "11";
    };

    subtest '数値：122333' => sub {
        is compress("122333"), "112233";
    };

    subtest '数値：1aa22bbb333' => sub {
        is compress("1aa22bbb333"), "11a222b333";
    };

};

subtest '異常系' => sub {

    subtest '引数無し' => sub {
        ok !compress("");
    };

};

done_testing();

