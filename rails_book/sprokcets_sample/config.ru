require 'sprockets'

map '/assets' do
  enviroment = Sprockets::Enviroment.new
  enviroment.append_path 'assets/javascripts'
  enviroment.append_path 'assets/stylesheet'
  run environment
end

map '/' do
  run Proc.new {|env| [200,{"Content-Type" => "text/html"},["Hello World"]}
end

