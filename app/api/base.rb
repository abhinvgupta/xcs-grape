require_relative 'v1/base'
module API
	module V1
		class Base < GRAPE::API
			mount API::V1::Base

		end
	end
end