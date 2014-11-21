# coding: utf-8
module NicoCmd

  class Command < Thor

    desc 'download', 'download video'
    option :sm,  :type => :array,  :aliases => '-s',   :required => true, :desc => "sm number"
    option :mp3, :type => :boolean, :aliases => '-m',  :desc => "mp3 convert"
    option :text, :type => :boolean, :aliases => '-t', :desc => "explanation text"
    def download
      login unless @niconico

      options[:sm].each do | id |

        # 動画情報の取得
        video = @niconico.video(id)

      end

    end

    private

    def login
      yaml_path = File.expand_path(File.dirname(__FILE__)+"../../../../user.yml")
      user = YAML.load_file(yaml_path)
      @niconico = Niconico.new(user["mail"], user["pass"])
      @niconico.login
    end

  end

end

