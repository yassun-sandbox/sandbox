class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.strign :name
      t.text :address

      t.timestamps
    end
  end
end
