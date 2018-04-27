class User < ApplicationRecord
	attr_accessor :remember_token
	before_save { self.email = email.downcase }

	has_many :posts
	has_many :shares
	has_many :likes
	has_many :comments

	has_many :searches

	has_many :likes_posts, :through => :likes, :source => :post

	has_many :friend_requests, dependent: :destroy
	has_many :pending_friends, through: :friend_requests, source: :friend

	has_many :friendships, dependent: :destroy
	has_many :friends, through: :friendships

	has_secure_password

	has_attached_file :profile_photo,
		styles: { small: "75x75>", medium: "300x300", large: "600x600>" },
		default_url: "/assets/images/nophoto.png"

	has_attached_file :cover_photo,
		styles: { medium: "700x700>", large: "1500x1500>" },
		default_url: "/assets/images/nocover.jpg"

	validates_attachment_content_type :profile_photo, content_type: /\Aimage\/.*\z/
	validates_attachment_content_type :cover_photo, content_type: /\Aimage\/.*\z/

	# Validations for this model

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
	validates :fullname, presence: true, length: { in: 2..30 }
	validates :password, presence: true, length: { in: 5..20 }, confirmation: true

	# Returns the hash digest of the given string.
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	# Returns a random token.
	def User.new_token
		SecureRandom.urlsafe_base64
	end

	# Remembers a user in the database for use in persistent sessions.
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	# Returns true if the given token matches the digest.
	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	# Forgets a user.
	def forget
		update_attribute(:remember_digest, nil)
	end

	# Friendships ------

	def remove_friend(friend, current_user)
		current_user.friends.destroy(friend)
	end
end
