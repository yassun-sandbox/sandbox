# coding: utf-8
require "thor"
require 'yaml'
require 'open3'

module Shukkin
  class Command < Thor
    desc 'shukkin', 'start'
    def shukkin
      puts "shukkin"
    end
  end
end

