class RenameUsernameCol < ActiveRecord::Migration[5.1]
	def change
		rename_column :users, :name, :fullname
	end
end
