class SetDefaultImagePostFalse < ActiveRecord::Migration[5.1]
	def up
		change_column :posts, :is_image_post, :boolean, default: false
	end

	def down
		change_column :posts, :is_image_post, :boolean, default: nil
	end
end
