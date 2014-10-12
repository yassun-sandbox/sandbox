class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :tweet
      t.string :body
      t.references :user, index: true

      t.timestamps
    end
  end
end
