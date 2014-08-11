class User < ActiveRecord::Base
	attr_accessor :new_password, :new_password_confirmation
	attr_reader :username, :password

	validates_confirmation_of :new_password, :if=>:password_changed?

	before_save :hash_new_password, :if=>:password_changed?

	def self.create(data)
		login = data[:username]
		salt = BCrypt::Engine.generate_salt
		digest = BCrypt::Engine.hash_secret(data[:password])
	end

	def password_changed?
		!@new_password.blank?
	end

	def self.authenticate(login, password)
		if user = find_by_login(login)
			if BCrypt::Password.new(user.hashed_password).is_password? password
				return user
			end
		end
		return nil
  end

private
	def hash_new_password
		self.hashed_password = BCrypt::Password.create(@new_password)
	end

end
