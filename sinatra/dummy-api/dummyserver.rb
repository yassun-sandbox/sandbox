require 'sinatra'

get '/users.xml' do
  content_type :xml
  fixture('users.xml')
end

get '/users.json' do
  content_type :json

  fixture('users.json')
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(File.join(fixture_path, file))
end

