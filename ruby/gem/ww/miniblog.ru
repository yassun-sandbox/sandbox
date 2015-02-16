require 'rubygems'
require 'json'

require 'ww'

app = WW::SpyEye.to_app do
  min_offset = 0

  get("/messages/:user.json") do |user|
    content_type "application/json"
    t = Time.local(2010, 3, 13, 12, 34 + (min_offset += 1), 56)
    [
      {:message => "#{user}です。ミニブログ始めました", :posted_on => t.iso8601},
      {:message => "2つめの#{user}つぶやきです", :posted_on => (t + 10*60).iso8601},
    ].to_json
  end
end

run app
