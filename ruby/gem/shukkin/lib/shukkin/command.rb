# coding: utf-8
require "thor"
require "mechanize"

module Shukkin
  class Command < Thor
    desc 'shukkin', 'start'
    def shukkin

      # ログイン情報の取得
      login_info = get_login_info

      agent = Mechanize.new
      agent.get(login_info["url"]) do |page|

        # ログイン
        page.form_with(:action => '/auth/remotelogin') do |form|
          form.field_with(:name => 'post[login]').value    = login_info["id"]
          form.field_with(:name => 'post[password]').value = login_info["pass"]
        end.click_button

      end

      p agent.post(login_info["punch_in_url"],{},login_info["header"]);

    end

    private

    def get_login_info
      yaml_path = File.expand_path(File.dirname(__FILE__)+"../../../tuba.yml")
      YAML.load_file(yaml_path)
    end

  end
end

