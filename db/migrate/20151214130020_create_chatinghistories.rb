class CreateChatinghistories < ActiveRecord::Migration
  def change
    create_table :chatinghistories do |t|
      t.integer :user_id
      t.integer :message_id

      t.timestamps null: false
    end
  end
end
