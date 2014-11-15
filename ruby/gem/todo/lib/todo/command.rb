# coding: utf-8

module Todo

  # コマンドラインベースの処理を行うクラスです
  class Command

    def execute
      DB.prepare
    end

    def create_task(name, content)
      # タスク作成時のstatusはデフォルト値が使われNOT_YETとなる。
      Task.create!(name: name, content: content).reload
    end

    def delete_task(id)
      task = Task.find(id)
      task.destroy
    end

    def update_task(id, attrbiutes)
      if status_name = attributes[:status]
        attributes[:status] = Task::STATUS.fetch(status_name.upcase)
      end

      task = Task.find(id)
      task.update_attributes! attributes

      task.reload
    end

  end

end
