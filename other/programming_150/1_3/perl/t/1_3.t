use strict;
use warnings;

use Test::More;
use Permtation;

subtest '正常系' => sub {

    subtest 'str1=ABC str2=CBA' => sub {
        ok permtation("ABC","CBA");
    };

    subtest 'str1=123 str2=321' => sub {
        ok permtation("123","321");
    };

    subtest 'str1=A str2=A' => sub {
        ok permtation("A","A");
    };

    subtest 'str1=1 str2=1' => sub {
        ok permtation("1","1");
    };

};

subtest '異常系' => sub {

    subtest '桁数が同じ場合' => sub {
        subtest 'str1=ABC str2=ABC' => sub {
            ok !permtation("ABC","ABC");
        };
    };

    subtest '桁数が違う場合' => sub {
        subtest 'str1=AB C str2=CBA' => sub {
            ok !permtation("AB C","CBA");
        };
    };

   subtest '引数が不足している場合' => sub {

        subtest 'str1= str2=' => sub {
            ok !permtation();
        };

        subtest 'str1= str2=CBA' => sub {
            ok !permtation("","CBA");
        };

        subtest 'str1=ABC str2=' => sub {
            ok !permtation("ABC","");
        };
    };
};

done_testing();

