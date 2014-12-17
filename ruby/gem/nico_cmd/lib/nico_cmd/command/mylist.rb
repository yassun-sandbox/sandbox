# coding: utf-8
module NicoCmd

  class Command < Thor

    desc 'my_list', 'mylist list videos '
    option :mylist_id, :type => :string, :aliases => '-m', :required => true, :desc => "target mylist id"
    option :dir, :type => :string,  :aliases => '-d', :required => true, :desc => "target dir"

    def mylist
      login unless @niconico

      target_dir = get_target_dir(options[:dir])

      @niconico.mylist(options[:mylist_id]).each do | video |

        puts video

        # ファイルの保存
        flv_path = dl_flv(target_dir, video)

        # 説明文の保存
        dl_ext_text(target_dir, video)

        # MP3への変換
        convert_mp3(flv_path)
      end

    end
  end
end

