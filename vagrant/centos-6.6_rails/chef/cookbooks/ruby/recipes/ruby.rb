# コンパイルに必要なyumパッケージのインストール
%w[gcc openssl openssl-devel].each do |pkg|
    package pkg do
        action :install
    end
end

# インストール
bash 'ruby::ruby::install' do
  not_if <<-EOC
    eval "$(rbenv init --no-rehash -)"
    rbenv versions | grep -q 2.1.5
  EOC
  code <<-EOC
    eval "$(rbenv init --no-rehash -)"
    rbenv install 2.1.5
  EOC
end
