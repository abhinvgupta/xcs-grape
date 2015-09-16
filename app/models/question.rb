class Question < ActiveRecord::Base
	establish_connection "#{Rails.env}_sec"
	@@que = []
	#@@answer =Answer.find(1)
	def arrr
		Question.find_each do |an|
			@@que << an.as_json
		end

	end

	def question
		@@que 
	end
	

end
