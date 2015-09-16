require_relative 'v1/base.rb'
module API
	class Base < Grape::API
		mount API::V1::Base

	end

end