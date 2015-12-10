class AddStatusColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :status, :boolean
  end
end
