class Question < ActiveRecord::Base
	has_many :question_texts
	has_many :session_questions
	
end
