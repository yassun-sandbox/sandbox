# アップデート
bash 'yum::update' do
  code <<-EOC
    yum update -y
  EOC
end

# Rubyコンパイルに必要なyumパッケージのインストール
%w[gcc openssl openssl-devel].each do |pkg|
    package pkg do
        action :install
    end
end

