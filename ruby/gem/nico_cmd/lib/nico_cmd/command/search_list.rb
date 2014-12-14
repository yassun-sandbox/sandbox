# coding: utf-8
module NicoCmd

  class Command < Thor

    desc 'search_list', 'download search video list '
    option :url, :type => :string,  :aliases => '-u', :required => true, :desc => "target url"
    def search_list
      agent = Mechanize.new
      page = agent.get(options[:url])
    end

  end
end

