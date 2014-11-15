# coding: utf-8

module Todo

  # コマンドラインベースの処理を行うクラスです
  class Command

    def execute
      DB.prepare
    end

    def create_task(name, content)
      # タスク作成時のstatusはデフォルト値が使われNOT_YETとなる。
      Task.create!(name: name, content: content, status: 0).reload
    end

    def delete_task(id)
      task = Task.find(id)
      task.destroy
    end

  end

end
