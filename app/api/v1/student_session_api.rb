# app/controllers/api/v1/student_session_api.rb
require_relative 'defaults'
module API
  module V1
    class StudentSessionApi < Grape::API

      include API::V1::Defaults

      helpers API::V1::Helpers

      #act on a specific question resource
      resource :student_session do

        desc "Start a student session"
        post :start do
          authenticate!
          student_session = StudentSession.start(current_user)
          #present student_session, with: API::V1::Representers::StudentSessionRepresenter
        end

        desc "Deprecated - End a student session"
        params do
          requires :id, type: Integer, desc: 'Student Session ID'
        end
        get ':id/end' do
          authenticate!
          StudentSession.end(params[:id])
        end

        desc "Post data from session to server"
        params do
          requires :id, type: Integer, desc: 'Student Session ID'
          requires :data, type: String, desc: 'Session Data'
        end
        post :data do
          authenticate!
          StudentSession.post_data(params[:id], params[:data])
          status 200
        end

      end

    end
  end
end
