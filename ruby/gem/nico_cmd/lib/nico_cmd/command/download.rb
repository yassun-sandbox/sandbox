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

      # 保存先の取得
      target_dir = get_target_dir(options[:dir])

      options[:sm].each do | id |

        # 動画情報の取得
        video = @niconico.video(id)

        # 動画ファイルの保存
        flv_path = dl_flv(target_dir, video)

        # 説明文の保存
        dl_ext_text(target_dir, video) if options[:html]

        # MP3への変換
        convert_mp3(flv_path) if options[:mp3]

      end

    end

    private

    def login
      yaml_path = File.expand_path(File.dirname(__FILE__)+"../../../../user.yml")
      user = YAML.load_file(yaml_path)
      @niconico = Niconico.new(user["mail"], user["pass"])
      @niconico.login
    end

    def get_target_dir(opt_dir)
      unless opt_dir then
        "./"
      else
        File.expand_path(opt_dir)
      end
    end

    def dl_ext_text(target_dir, video)
      open(File.join(target_dir, "#{video.id}.html"), "w") do |f|
        f.write '<html lang="ja">'
        f.write '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />'
        f.write  %Q[<h1>#{video.title}</h1>]
        f.write  %Q[<a href="#{video.url}">#{video.id}</a>]
        f.write video.description
        f.write '</html>'
      end
    end

    def dl_flv(target_dir, video)
      flv_path = File.join(target_dir, "#{video.id}.flv")
      open(flv_path, "w"){|f| f.write video.get_video }
      flv_path
    end

    def convert_mp3(flv_path)
      mp3_path = Pathname(flv_path).sub_ext(".mp3")
      Open3.capture3("ffmpeg -y -i #{flv_path} #{mp3_path}")
    end

  end
end

