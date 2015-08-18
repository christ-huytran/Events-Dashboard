class User < ActiveRecord::Base
	has_secure_password
	has_many :events, dependent: :destroy
	has_many :attendings, dependent: :destroy
	has_many :events_attending, through: :attendings, source: :event
	has_many :comments

	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, :city, :state, presence: true
	validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}

	before_save do
		self.email.downcase!
	end
end
