require 'test_helper'

class CommentTest < ActiveSupport::TestCase
	test "comment must have content" do
		comment = Comment.new(user_id: 1, post_id: 1)
		assert !comment.save, "saved comment with no content!"
	end

	test "comment must have post" do
		comment = Comment.new(user_id: 1, content: "test")
		assert !comment.save, "saved comment with no post!"
	end

	test "comment must have user" do
		comment = Comment.new(post_id: 1, content: "test")
		assert !comment.save, "saved comment with no user!"
	end

	test "after making 1 comment, the comment should belong to a user" do
		user = User.new(fullname: "Lukas Romsicki", password: "testtest", email: "test@test.com", id: 1)
		user.save

		post = Post.new(title: "test", content: "test", user_id: 1, id: 1)
		post.save

		comment = Comment.new(post_id: 1, user_id: 1, content: "test")
		comment.save

		assert (user.comments.first == comment), "user doesn't have it's comment"
	end
end
