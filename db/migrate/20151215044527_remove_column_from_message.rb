class RemoveColumnFromMessage < ActiveRecord::Migration
  def change
    remove_column :messages, :sender, :string
  end
end
