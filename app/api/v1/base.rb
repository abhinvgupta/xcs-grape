require_relative 'end.rb'
require_relative 'permission.rb'
require_relative 'score'
require_relative 'auth'
require_relative 'ansapi'
require_relative 'question_api'
require_relative 'student_session_api'
require_relative 'process'
require_relative 'panel'

module API
	module V1
		class Base < Grape::API
			mount API::V1::End
			mount API::V1::Score
			mount API::V1::Auth
			mount API::V1::Permission
			mount API::V1::Ansapi
			mount API::V1::QuestionApi
			mount API::V1::StudentSessionApi
			mount API::V1::Process
			mount API::V1::Panel 
		end
	end
end