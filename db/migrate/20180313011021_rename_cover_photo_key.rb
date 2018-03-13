class RenameCoverPhotoKey < ActiveRecord::Migration[5.1]
	def change
		remove_attachment :users, :cover_url
		add_attachment :users, :cover_photo
	end
end
