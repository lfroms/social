class User < ApplicationRecord
	has_many :posts
	has_many :shares
	has_many :likes
	has_many :comments

	has_many :likes_posts, :through => :likes, :source => :post

	# Validations for this model

	validates :email, presence: true, uniqueness: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
	validates :fullname, presence: true, length: { minimum: 2 }
	validates :password, presence: true, length: { minimum: 5 }

	# TODO: Password confirmation
end
