class User < ActiveRecord::Base
	has_many :student_sessions
	# after_create :generate_confirmation_token!

	# has_secure_password
	def self.authenticate(password)
	    puts "In self.authenticate"
	    return nil  unless user = find_by_password(password)
	    #return user if     user.authenticated?(password)
	end

	private

	# def generate_confirmation_token!
	# 	self.confirmation_token=Digest::SHA1.hexdigest("#{Time.now}-#{self.updated_at}")
	# 	self.save
	# end

end


