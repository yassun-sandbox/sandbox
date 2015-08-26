require 'sprockets'
require "coffee_script"
require "therubyracer"
require "sass"

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets/javascripts'
  environment.append_path 'assets/stylesheets'
  run environment
end

map '/' do
  run Proc.new {|env| [200,{"Content-Type" => "text/html"},["Hello World"]] }
end

