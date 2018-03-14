class Search < ApplicationRecord
	belongs_to :user

	def users
		@users ||= find_users
	end

	def posts
		@posts ||= find_posts
	end

	private

	def find_users
		users = User.order(:fullname)
		users = users.where("fullname like ?", "%#{keywords}%") if keywords.present?
		users
	end

	def find_posts
		posts = Post.order(:content)
		posts = posts.where("content like ?", "%#{keywords}%") if keywords.present?
		posts
	end
end
