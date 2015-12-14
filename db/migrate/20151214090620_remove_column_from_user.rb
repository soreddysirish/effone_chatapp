class RemoveColumnFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :blocked, :boolean
  end
end
