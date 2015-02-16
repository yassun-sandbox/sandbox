# miniblog_client.rb
require 'rubygems'
require 'json'
require 'open-uri'

class MiniblogClient
  def initialize(conn, *friends)
    @connection = conn
    @friends = friends
  end

  def entry_list(newer_first = true)
    entries = @friends.
    map {|f| JSON.parse(@connection.get("/messages/#{f}.json")) }.
flatten.
    sort_by {|e| e["posted_on"] }

    newer_first ? entries.reverse : entries
  end
end

class Connection
  def initialize(host, port)
    @host, @port = host, port
  end
  def get(abs_path)
    open("http://#{@host}:#{@port}#{abs_path}").read
  end
end

if __FILE__ == $0
  conn = Connection.new("localhost", 3080)
  client = MiniblogClient.new(conn, "alice", "bob", "charls")
  puts "新着順"
  client.entry_list.each{|e| puts "#{e["posted_on"]}: #{e["message"]}" }
  puts "古い順"
  client.entry_list(false).each{|e| puts "#{e["posted_on"]}: #{e["message"]}" }
end
