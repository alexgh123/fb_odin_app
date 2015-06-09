class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :posts, [:user_id, :created_at]
    #By including both the user_id and created_at columns as an array, we arrange for Rails to create a multiple key index, which means that Active Record uses both keys at the same time.
  end
end
