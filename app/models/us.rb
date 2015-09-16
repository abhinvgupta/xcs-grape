class Us < ActiveRecord::Base
	establish_connection "#{Rails.env}"
	self.table_name = 'users'

end