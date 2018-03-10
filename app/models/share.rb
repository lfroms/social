class Share < ApplicationRecord
	belongs_to :user

	has_many :likes
	has_many :comments

	# Validations for this model

	validates :user_id, presence: true
	validates :post_id, presence: true
end
