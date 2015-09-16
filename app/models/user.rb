class User < ActiveRecord::Base

	establish_connection "#{Rails.env}_sec"
	@@que = []
	#@@answer =Answer.find(1)
	def arrr
		ss =User.where(id: (80..110))
		ss.each do |s|
			@@que << s.as_json
		end


	end

	def question
		@@que 
	end
	

end