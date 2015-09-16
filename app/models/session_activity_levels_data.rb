class SessionActivityLevelsData < ActiveRecord::Base
	self.table_name = 'session_activity_levels_data'
	belongs_to :student_session	
end
