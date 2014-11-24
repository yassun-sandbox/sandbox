# coding: utf-8
module NicoCmd

  class Command < Thor

    desc 'download', 'download video'
    option :sm,  :type => :array,   :aliases => '-s',   :required => true, :desc => "sm number"
    option :mp3, :type => :boolean, :aliases => '-m',   :desc => "mp3 convert"
    option :html,:type => :boolean, :aliases => '-t',   :desc => "explanation text"
    option :dir, :type => :string,  :aliases => '-d',   :desc => "target dir"
    def download
      login unless @niconico

      unless options[:dir] then
        target_dir = "./"
      else
        target_dir = File.expand_path(options[:dir])
      end

      options[:sm].each do | id |

        # 動画情報の取得
        video = @niconico.video(id)

        # 動画ファイルの保存
        open(File.join(target_dir, "#{id}.flv"), "w"){|f| f.write video.get_video }

        # 説明文の保存
        if options[:html] then

          open(File.join(target_dir, "#{id}.html"), "w") do |f|
            f.write '<html lang="ja">'
            f.write '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />'
            f.write  %Q[<h1>#{video.title}</h1>]
            f.write  %Q[<a href="#{video.url}">#{video.id}</a>]
            f.write video.description
            f.write '</html>'
          end
        end

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

