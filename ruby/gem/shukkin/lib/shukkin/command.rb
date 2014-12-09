# coding: utf-8
require "thor"
require "mechanize"

module Shukkin
  class Command < Thor
    desc 'shukkin', 'start'
    def shukkin

      # サイト情報の取得
      site_info = get_site_info

      agent = Mechanize.new
      agent.get(site_info["url"]) do |page|

        # ログイン
        response = page.form_with(:action => '/auth/remotelogin') do |form|
          form.field_with(:name => 'post[login]').value    = site_info["id"]
          form.field_with(:name => 'post[password]').value = site_info["pass"]
        end.click_button

        # CSRFトークン
        csrf_token = response.at('meta[@name="csrf-token"]')[:content]
        csrf_hash  = { 'X-CSRF-Token' => csrf_token }

        # Cookie
        cookie_hash = get_cookie_hash(site_info["cookie"], agent.cookie_jar.jar)

        # 共通ヘッダー
        header = site_info["header"]

        # マージ
        header.merge!(csrf_hash).merge!(cookie_hash)

        agent.post(site_info["punch_in_url"], {}, header);

      end


    end

    private

    def get_site_info
      yaml_path = File.expand_path(File.dirname(__FILE__)+"../../../site_info.yml")
      YAML.load_file(yaml_path)
    end

    def get_cookie_hash(cookie_info, cookie_jar)
        domain = cookie_info["domain"]
        path   = cookie_info["path"]
        name   = cookie_info["name"]

        cookie_name = cookie_jar[domain][path][name].name
        cookie_val  = cookie_jar[domain][path][name].value
        cookie = cookie_name + "=" + cookie_val
        { "Cookie" => cookie }
    end

  end
end

