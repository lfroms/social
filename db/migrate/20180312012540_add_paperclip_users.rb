class AddPaperclipUsers < ActiveRecord::Migration[5.1]
	def up
		remove_column :users, :profile_url, :string
		remove_column :users, :cover_url, :string

		add_attachment :users, :profile_photo
		add_attachment :users, :cover_url
	end

	def down
		remove_attachment :users, :profile_photo
		remove_attachment :users, :cover_url
	end
end
