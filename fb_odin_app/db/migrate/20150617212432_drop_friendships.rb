class DropFriendships < ActiveRecord::Migration

  def up
    drop_table :friendships
  end

  def down
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.boolean :approved

      t.timestamps null: false
    end
  end

end


