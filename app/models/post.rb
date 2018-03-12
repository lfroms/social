class Post < ApplicationRecord
	belongs_to :user
	has_many :likes

	has_many :comments

	has_attached_file :image, styles: { medium: "600x600>", large: "1600x1600>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	self.per_page = 10

	# Validations for this model

	validates :user_id, presence: true
	validates :content, presence: true, length: { minimum: 1 }, unless: Proc.new{ |u| u.title.present? }
	validates :title, presence: true, length: { minimum: 1 }, unless: Proc.new{ |u| u.content.present? }

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
