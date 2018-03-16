require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "user must not have blank fields" do
		user = User.new
		assert !user.save, "Saved user with all blank validations"
	end

	test "password must be greater or equal to 5 chars" do
		user = User.new(password: "123")
		assert !user.save, "Saved user with password with less than 5 chars"
	end

	test "email must be present" do
		user = User.new(fullname: "Lukas Romsicki", password: "12345")
		assert !user.save, "Saved user with no email"
	end

	test "email must be unique" do
		user1 = User.new(fullname: "Lukas Romsicki", password: "12345", email: "test@test.com")
		user1.save
		user2 = User.new(fullname: "Lukas Romsicki", password: "12345", email: "test@test.com")
		assert !user2.save, "Saved user with identical email"
	end
end
