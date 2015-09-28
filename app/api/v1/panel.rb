require_relative 'helpers'
require_relative 'defaults'
module API
  module V1
    class Panel < Grape::API
      include API::V1::Defaults

      resource :user do 
      	post 'login' do  
      		params do
      			requires :username,type: :string
      			#requires :password,type: :string
      		end
      		user = User.authenticate(params[:username])
      		if user
      			puts user
      		end
          user

      	end
      end

    end
  end
end