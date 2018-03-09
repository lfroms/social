class Post < ApplicationRecord
	has_many :user
	has_many :likes

	has_many :comments
end
