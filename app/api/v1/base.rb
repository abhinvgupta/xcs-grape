require_relative 'end.rb'
module API
	module V1
		class Base < Grape::API
			mount API::V1::End

		end
	end
end