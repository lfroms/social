class Post < ApplicationRecord
	belongs_to :user
	has_many :likes

	has_many :comments

	def like(user)
		@like = Like.new
		@like.user_id = user.id
		@like.post_id = id
		@like.save
	end

	def unlike(user)
		likes.where(user_id: user.id).first.destroy
	end
end
