# coding: utf-8
module NicoCmd

  class Command < Thor

    desc 'search_list', 'download search video list '
    option :url, :type => :string,  :aliases => '-u', :required => true, :desc => "target url"
    def search_list
      agent = Mechanize.new
      page = agent.get(options[:url])
      page.links.each do | link |
        if %r(/watch/sm[\d]?) =~ link.href
          nico_id = link.href.scan(/sm[\d]+/)[0]
          puts [nico_id, link.text, "http://nicovideo.jp/#{nico_id}"].join("\t")
        end
      end

    end
  end
end

