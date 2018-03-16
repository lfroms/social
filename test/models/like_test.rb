require 'test_helper'

class LikeTest < ActiveSupport::TestCase
	test "make a like with no post id" do
		like = Like.new(user_id: 1)
		assert !like.save, "saved like with no post!"
	end

	test "make a like with no user id" do
		like = Like.new(post_id: 1)
		assert !like.save, "saved like with no user!"
	end

	test "after making 1 like, the user should have 1 like" do
		user = User.new(fullname: "Lukas Romsicki", password: "testtest", email: "test@test.com", id: 1)
		user.save

		post = Post.new(title: "test", content: "test", user_id: 1, id: 1)
		post.save

		like = Like.new(post_id: 1, user_id: 1)
		like.save

		assert (user.likes_posts.all.count == 1), "user doesn't like only 1 post"
	end
end
