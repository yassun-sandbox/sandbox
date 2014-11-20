#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

require 'atomutil'

USERNAME    = ARGV[0]
BLOG_DOMAIN = ARGV[1]
API_KEY    = ARGV[2]

entry_uri = "https://blog.hatena.ne.jp/#{USERNAME}/#{BLOG_DOMAIN}/atom/entry"

auth = Atompub::Auth::Wsse.new(
  username: USERNAME,
  password: API_KEY
)

client = Atompub::Client.new(auth: auth)

p client.get_entry(entry_uri)

