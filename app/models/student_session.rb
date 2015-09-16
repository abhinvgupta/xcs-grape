class StudentSession < ActiveRecord::Base
	belongs_to :user
	has_many :student_session_data
	has_many :session_assessments
	has_one :session_activity_data
	has_many :session_activity_levels_data
	
end