require 'sinatra'
require 'json'

set :public_folder, File.dirname(__FILE__) + '/dist'

get '/' do
  [
    '<a href="/customer.html">customer</a>',
    '<a href="/daicho.html">daicho</a>',
  ].join("<br>")
end

post '/api/customer' do
  p JSON.parse(request.body.read)
  "ok"
end

options '*' do
  headers "Access-Control-Allow-Origin" => "*",
          "Access-Control-Allow-Headers" => "Origin, X-Requested-With, Content-Type, Accept"
end

