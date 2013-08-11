class User < ActiveRecord::Base

	attr_accessor :password
    attr_accessible :email, :password, :password_confirmation, :first_name, :last_name

    before_save :encrypt_password

    validates_confirmation_of :password
    validates_presence_of :password, :on => :create

    validates :email, :presence => true,
    				   :uniqueness => true

 	validates_presence_of :first_name
 	validates_presence_of :last_name

 	# Authenticate a user against a password.  Return the user object if the user
 	# is authenticated.
 	def self.authenticate(username, password)
 		user = find_by_username(username);

 		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt);
 			return user
 		else
 			return nil
 		end
 	end

 	# Encrypts a password before saving a User object to the database
 	def encrypt_password
 		if password.present?
 			self.password_salt = BCrypt::Engine.generate_salt
 			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
 		end
 	end

end
