class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :post_id
      t.integer :liked_by_user_id

      t.timestamps
    end
  end
end
