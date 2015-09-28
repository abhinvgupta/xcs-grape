class User < ActiveRecord::Base
	include Clearance::User
	has_many :student_sessions
	# after_create :generate_confirmation_token!

	# has_secure_password
	def self.authenticate(userid,password)
	    puts "In self.authenticate"
	    if user = User.where(:username => userid)
	    	return user
	    else 
	    	return nil

	    end

	
	end

	private

	# def generate_confirmation_token!
	# 	self.confirmation_token=Digest::SHA1.hexdigest("#{Time.now}-#{self.updated_at}")
	# 	self.save
	# end

end


