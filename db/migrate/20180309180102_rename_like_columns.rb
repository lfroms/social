class RenameLikeColumns < ActiveRecord::Migration[5.1]
	def change
		rename_column :likes, :liked_by_user_id, :user_id
	end
end
