class Post < ApplicationRecord
	belongs_to :user
	has_many :likes

	has_many :comments

	self.per_page = 10

	# Validations for this model

	validates :user_id, presence: true
	validates :content, presence: true, length: { minimum: 1 }, unless: Proc.new{ |u| u.title.present? }
	validates :title, presence: true, length: { minimum: 1 }, unless: Proc.new{ |u| u.content.present? }

	validates :is_image_post, inclusion: [true, false]
	validates :attachment_img_url, presence: true, unless: Proc.new{ |u| u.is_image_post == false }

	# Model methods

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
