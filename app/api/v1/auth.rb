require_relative 'helpers'
module API
  	module V1
    	class Auth < Grape::API
    		

    		helpers do 

			    def authenticate!
			      error!('Unauthorized. Invalid or expired token.', 401) unless current_user
			    end

			    def current_user
			      # find token. Check if valid.
			      token = ApiKey.where(access_token: params[:token]).first
			      if token && !token.expired?
			        @current_user = User.find(token.user_id)
			      else
			        false
			      end
			    end
			end

			resource :auth do

			  desc "Creates and returns access_token if valid login"
			  params do
			    requires :login, type: String, desc: "Username or email address"
			    requires :password, type: String, desc: "Password"
			  end
			  post :login do

			    user = User.authenticate(params[:login], params[:password])


			    if user 
			      key = ApiKey.create(user_id: user.id)
			      {token: key.access_token}
			    else
			      error!('Unauthorized.', 401)
			    end
			  end

			  desc "Returns pong if logged in correctly"
			  params do
			    requires :token, type: String, desc: "Access token."
			  end
			  get :ping do
			    authenticate!
			    { message: "pong" }
			  end
			end 

			get 'kk' do 
				{"d" => "d"}
			end

		end
	end
end