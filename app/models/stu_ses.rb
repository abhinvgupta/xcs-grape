class StuSes < ActiveRecord::Base

	establish_connection "#{Rails.env}"
	self.table_name = 'student_sessions'
end
