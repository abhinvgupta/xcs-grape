class SessionActivityData < ActiveRecord::Base
	belongs_to :student_session	
	has_many :session_activity_levels_data

end
