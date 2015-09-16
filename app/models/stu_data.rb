class StuData < ActiveRecord::Base

	establish_connection "#{Rails.env}"
	self.table_name = 'student_session_data'
end
