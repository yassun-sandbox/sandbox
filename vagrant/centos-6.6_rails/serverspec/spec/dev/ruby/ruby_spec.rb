require 'spec_helper'

# ServerspecではデフォルトでSudoでコマンドが使用される。
# なので/etc/profile.d/rbenv.sh;が読まれないのでsourceコマンドを付与。
describe command('source /etc/profile.d/rbenv.sh; which ruby') do
  its(:stdout) { should eq "/opt/rbenv-0.4.0/shims/ruby\n" }
  its(:exit_status) { should eq 0 }
end

describe command('source /etc/profile.d/rbenv.sh; ruby -v') do
  its(:stdout) { should match %r!ruby 2.1.5p273! }
  its(:exit_status) { should eq 0 }
end

