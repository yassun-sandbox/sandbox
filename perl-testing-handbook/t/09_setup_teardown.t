use strict;
use warnings;

use Test::More;
use Scope::Guard;

subtest 'myClass' => {
    my $setup = sub {
        # テスト対象のオブジェクトを生成
       Scope::Guard->new(sub{
               # TearDown
           });
    };

    subtest '#new' => sub{
        my $guard = $setup->();
        # hogehoge
    }

    subtest '#xxx' => sub {
        my $guard = $setup->();
        # hugahuga
    };

};

done_testing;

