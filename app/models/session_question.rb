class SessionQuestion < ActiveRecord::Base
	belongs_to :session_assessment
	belongs_to :answer
	belongs_to :question
end
