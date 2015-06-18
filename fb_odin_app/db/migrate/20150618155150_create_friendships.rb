class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :user_1_id
      t.integer :user_2_id
      t.string :user_1_status
      t.string :user_2_status

      t.timestamps null: false
    end
  end
end
