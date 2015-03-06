require 'sinatra/base'
require 'haml'

module HelloChat
  class App < Sinatra::Base
    get "/" do
      haml :index
    end
  end
end
