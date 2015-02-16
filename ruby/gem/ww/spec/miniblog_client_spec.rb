$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'miniblog_client'
require 'ww'

describe MiniblogClient do
  before(:all) do
    WW::Server.handler = :webrick
    WW::Server[:miniblog] ||= WW::Server.build_double(3080) do
      m_offset = 0

      spy.get("/messages/:user.json") do |user|
        content_type "application/json"
        t = Time.local(2010, 3, 13, 12, 34 + (m_offset += 1), 56)
        [
          {:message => "#{user}です。ミニブログ始めました", :posted_on => t.iso8601},
          {:message => "2つめの#{user}つぶやきです", :posted_on => (t + 10*60).iso8601},
        ].to_json
      end
    end
    WW::Server.start_once(:miniblog)
  end

  it "サーバが正常に起動していること" do
    expect {
      TCPSocket.open('localhost', 3080).close
    }.should_not raise_exception(Errno::ECONNREFUSED)
  end
end
