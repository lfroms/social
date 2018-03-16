require 'test_helper'

class PostTest < ActiveSupport::TestCase
	test "post must have all three fields" do
		post = Post.new()
		assert !post.save, "saved empty post"
	end

	test "post must have user_id and either content or title" do
		post1 = Post.new(user_id: 1, title: "test")
		assert !post1.save, "saved post with id and title"

		post2 = Post.new(user_id: 1, content: "test")
		assert !post2.save, "saved post with id and content"
	end

	test "post with no user id" do
		post = Post.new(title: "hello", content: "hi")
		assert !post.save, "saved with no user id!"
	end

	test "after making 1 like, the post should have 1 like" do
		user = User.new(fullname: "Lukas Romsicki", password: "testtest", email: "test@test.com", id: 1)
		user.save

		post = Post.new(title: "test", content: "test", user_id: 1, id: 1)
		post.save

		like = Like.new(post_id: 1, user_id: 1)
		like.save

		assert (post.likes.all.count == 1), "post doesn't have only 1 like"
	end

	test "post should have user after being created" do
		user = User.new(fullname: "Lukas Romsicki", password: "testtest", email: "test@test.com", id: 1)
		user.save

		post = Post.new(title: "test", content: "test", user_id: 1, id: 1)
		post.save

		assert post.user == user, "post doesn't have correct user"
	end

	test "after making 1 comment, the post should have 1 comment" do
		user = User.new(fullname: "Lukas Romsicki", password: "testtest", email: "test@test.com", id: 1)
		user.save

		post = Post.new(title: "test", content: "test", user_id: 1, id: 1)
		post.save

		comment = Comment.new(post_id: 1, user_id: 1, content: "test")
		comment.save

		assert (post.comments.all.count == 1), "post doesn't have 1 comment"
	end
end
