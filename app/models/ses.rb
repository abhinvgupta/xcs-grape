class Ses < ActiveRecord::Base
	establish_connection "#{Rails.env}"
	self.table_name = 'session_activity_data'
end