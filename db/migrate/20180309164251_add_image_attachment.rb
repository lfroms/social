class AddImageAttachment < ActiveRecord::Migration[5.1]
	def change
		change_table :posts do |t|
			t.column :attachment_img_url, :string
		end
	end
end
