# coding: utf-8
require "thor"
require "mechanize"

module Shukkin
  class Command < Thor
    desc 'shukkin', 'start'
    def shukkin
      login_info = get_login_info

      agent = Mechanize.new
      agent.get(login_info["url"]) do |page|
      end

    end

    private

    def get_login_info
      yaml_path = File.expand_path(File.dirname(__FILE__)+"../../../tuba.yml")
      YAML.load_file(yaml_path)
    end

  end
end

