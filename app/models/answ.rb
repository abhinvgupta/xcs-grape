class Answ < ActiveRecord::Base

	establish_connection "#{Rails.env}"
	self.table_name = 'answers'
end