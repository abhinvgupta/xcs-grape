class Ques < ActiveRecord::Base

	establish_connection "#{Rails.env}"
	self.table_name = 'questions'
end