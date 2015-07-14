require "http/server"

class TestHandler < HTTP::Handler
  def call(request : HTTP::Request) : HTTP::Response
    HTTP::Response.ok("text/plain", "Hello World")
  end
end

server = HTTP::Server.new(3000, TestHandler.new)
server.listen

