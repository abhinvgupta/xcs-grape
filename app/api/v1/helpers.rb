module API
	module V1
		module Helpers
			def ll(gg)
				return gg
			end
			def self.stat(idd)
				ssaa = SessionAssessment.find(idd)
				ssaa.update(state: "processedj")


			end
			def self.included(base)
	    		base.extend Helpers
	  		end
		  
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
	end

end


