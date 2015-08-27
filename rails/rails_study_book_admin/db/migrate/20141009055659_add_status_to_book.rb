class AddStatusToBook < ActiveRecord::Migration
  def change
    add_column :books, :status, :interger
  end
end
