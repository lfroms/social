class CleanUpUnusedFields < ActiveRecord::Migration[5.1]
	def change
		remove_column :posts, :attachment_img_url, :string
		remove_column :posts, :is_image_post, :string
	end
end
