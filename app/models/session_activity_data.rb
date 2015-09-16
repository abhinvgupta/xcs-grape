class SessionActivityData < ActiveRecord::Base
	establish_connection "#{Rails.env}_sec"
	@@arr = []
	#@@answer =Answer.find(1)
	def arrr
		SessionActivityData.find_each do |an|
			@@arr << an.as_json
		end

	end

	def ans
		@@arr 
	end
	


end
