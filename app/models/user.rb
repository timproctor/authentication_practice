class User < ActiveRecord::Base
	validates :login, presence: true
	has_secure_password
end
