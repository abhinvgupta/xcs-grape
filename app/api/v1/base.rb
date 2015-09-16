require_relative 'end'
module API
	module V1
		class Base < GRAPE::API
			mount API::V1::End

		end
	end
end