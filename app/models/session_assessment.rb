class SessionAssessment < ActiveRecord::Base
	has_many :session_questions
	belongs_to :student_session
	

end