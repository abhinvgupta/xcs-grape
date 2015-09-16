class SessionVideoData < ActiveRecord::Base
	self.table_name = 'session_video_data'
	belongs_to :student_sessions
end
