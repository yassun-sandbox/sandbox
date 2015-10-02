require 'sinatra'
set :public_folder, File.dirname(__FILE__) + '/dist'

post '*' do
  temp = params[:file]["0"][:tempfile]

  File.open('./hoge', 'wb') do |f|
        f.write temp.read
        @mes = "アップロード成功"
  end
end
