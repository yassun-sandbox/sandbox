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

      options[:sm].each do | id |

        # 動画情報の取得
        video = @niconico.video(id)

        # 保存先の取得
        target_dir = get_target_dir(options[:dir])

        # 動画ファイルの保存
        open(File.join(target_dir, "#{id}.flv"), "w"){|f| f.write video.get_video }

        # 説明文の保存
        build_ext_text(target_dir, video) if options[:html]

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

    def build_ext_text(target_dir, video)
      open(File.join(target_dir, "#{video.id}.html"), "w") do |f|
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

