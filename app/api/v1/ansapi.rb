require_relative 'helpers'
require_relative 'defaults'
module API
  module V1
    class Ansapi < Grape::API
      include API::V1::Defaults
      
      format :json
      # helpers do 

      #     def authenticate!
      #       error!('Unauthorized. Invalid or expired token.', 401) unless current_user
      #     end

      #     def current_user
      #       # find token. Check if valid.
      #       token = ApiKey.where(access_token: params[:token]).first
      #       if token && !token.expired?
      #         @current_user = User.find(token.user_id)
      #       else
      #         false
      #       end
      #     end
      # end

      resource :answers do
        desc "Return list of Answers"
        params do
          optional :page, type: Integer, default: 1, desc: 'Number of answers to return.'
          optional :size, type: Integer, default: 3, desc: 'Number of answers to return.'
        end
        get '/' do
          authenticate!
          answers = Answer.first
          #present answers, with: API::V1::Representers::AnswersRepresenter
        end

      end

      get 'cuser' do 
        params do 
          requires :token,type: String
        end
        current_user
      end
    end
  end
end








