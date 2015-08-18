class Event < ActiveRecord::Base
	belongs_to :user
	has_many :attendings
	has_many :users_attending, through: :attendings, source: :user
	has_many :comments
end
