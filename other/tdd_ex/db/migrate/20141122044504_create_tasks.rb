class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :contents
      t.integer :order

      t.timestamps
    end
  end
end
