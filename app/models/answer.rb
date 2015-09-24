class Answer < ActiveRecord::Base

	has_many :answer_texts
	has_many :session_questions
end
