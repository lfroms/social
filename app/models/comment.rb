class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :post

	has_many :likes

	validates :content, presence: true
	validates :user_id, presence: true
	validates :post_id, presence: true
end
