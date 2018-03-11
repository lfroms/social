# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: "lrom@me.com",
	fullname: "Lukas Romsicki",
	password: "12345",
	bio: "This is my fantastic bio!",
	profile_url: "http://localhost:3000/assets/lukas.jpg")

User.create!(email: "thing@thing.com",
	fullname: "Another User",
	password: "12345",
	bio: "This is my fantastic bio!")

Post.create!(user_id: 1,
	title: "A First Post. Surreal.",
	content: "This is my very first post!  Hi there, this post is being used for testing purposes.",
	is_image_post: false)

Post.create!(user_id: 1,
	title: "Wow another post, hi there.",
	content: "This my second post.  Wow, what a great post.",
	is_image_post: false)

Post.create!(user_id: 2,
	title: "Hello! This is a post!",
	content: "Another User has finally made a post.  Would you look at that!",
	is_image_post: true,
	attachment_img_url: "http://localhost:3000/assets/demo.jpg")

Post.create!(user_id: 1,
	title: "A thing.  A post by a person.  Text.",
	content: "And this is the latest and final post.  Cool!",
	is_image_post: false)

Share.create!(post_id: 1, user_id: 1)
Share.create!(post_id: 2, user_id: 1)

Comment.create!(post_id: 1, user_id: 1, content: "Wow what a great post!  Quality content.")
Comment.create!(post_id: 3, user_id: 1, content: "Wow what a great post!  Quality content.")

Like.create!(post_id: 1, user_id: 1)
Like.create!(post_id: 2, user_id: 1)
Like.create!(post_id: 2, user_id: 2)


