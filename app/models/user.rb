class User < ApplicationRecord
	has_many :posts
	has_many :likes
	has_many :comments

	has_many :likes_posts, :through => :likes, :source => :post
end
