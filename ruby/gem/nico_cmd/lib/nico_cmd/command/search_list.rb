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
          puts " -------------- "
          puts link.text
          puts nico_id = link.href.scan(/sm[\d]+/)[0]
          puts "http://nicovideo.jp/#{nico_id}"
          puts " -------------- "
        end

      end
    end

  end
end

