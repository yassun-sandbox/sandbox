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
