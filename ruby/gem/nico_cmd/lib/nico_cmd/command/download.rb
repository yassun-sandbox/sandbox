# coding: utf-8
module NicoCmd

  class Command < Thor

    desc 'download', 'download video'
    option :sm,  :type => :array,  :aliases => '-s',   :required => true, :desc => "sm number"
    option :mp3, :type => :boolean, :aliases => '-m',  :desc => "mp3 convert"
    option :text, :type => :boolean, :aliases => '-t', :desc => "explanation text"
    def download
      login unless @niconico

      ids = options[:sm]

#
#      # 動画情報の取得
#      video = @niconico.video(id)
#      puts video.id
#      puts video.title
#      puts video.description
#      puts video.description_raw
#      puts video.url
#      puts video.video_url
#      puts video.type
#      puts video.tags
#      puts video.mylist_comment
#      puts video.api_data

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

