#=======================================================================================================================
# Base: ロケール
#=======================================================================================================================

# 言語/文字コード
template '/etc/sysconfig/i18n' do
  source 'locale.i18n.erb'
end

# クロック制御
template '/etc/sysconfig/clock' do
  source 'locale.clock.erb'
end

# タイムゾーン
link '/etc/localtime' do
  to '/usr/share/zoneinfo/Asia/Tokyo'
end
