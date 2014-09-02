use strict;
use warnings;
use utf8;

use Test::More;
use IsUniqueChar;

subtest '引数がない場合' => sub {
    ok !isUniqueChar();
};

subtest '引数が一文字の場合' => sub {
    ok isUniqueChar("A");
};

subtest '重複した文字が存在しない場合' => sub {
    ok isUniqueChar("ABCDEFG");
};

subtest '重複した文字が存在する場合' => sub {
    ok !isUniqueChar("ABADEFG");
};

done_testing;

