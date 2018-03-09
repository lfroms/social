class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password
      t.text :bio
      t.string :profile_url
      t.string :cover_url

      t.timestamps
    end
  end
end
