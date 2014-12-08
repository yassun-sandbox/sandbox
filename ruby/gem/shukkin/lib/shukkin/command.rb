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
        page.form_with(:action => '/auth/remotelogin') do |form|
          form.field_with(:name => 'post[login]').value    = site_info["id"]
          form.field_with(:name => 'post[password]').value = site_info["pass"]
        end.click_button

      end

      p agent.post(site_info["punch_in_url"], {}, site_info["header"]);

    end

    private

    def get_site_info
      yaml_path = File.expand_path(File.dirname(__FILE__)+"../../../site_info.yml")
      YAML.load_file(yaml_path)
    end

  end
end

