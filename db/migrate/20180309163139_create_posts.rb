class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :content
      t.boolean :is_image_post

      t.timestamps
    end
  end
end
