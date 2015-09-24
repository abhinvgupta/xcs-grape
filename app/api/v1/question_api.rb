# app/controllers/api/v1/question_api.
require_relative 'defaults'
module API
  module V1
    class QuestionApi < Grape::API
      include API::V1::Defaults

      #act on a specific question resource
      resource :question do
        desc "Get a question"
        params do
          requires :id, type: Integer, desc: 'Question id.'
        end
        get ':id' do
          authenticate!
          question = Question.find(params[:id])
          present question, with: API::V1::Representers::QuestionRepresenter
        end

        desc "Get next question based on results"
        params do
          requires :id, type: Integer, desc: 'Question id.'
          requires :path, type: String, desc: 'correct or incorrect.'
        end
        get ':id/next/:path' do
          authenticate!
          question = Question.next(params[:id], params[:path])
          present question, with: API::V1::Representers::QuestionRepresenter
        end

        desc "Get answers for a question"
        params do
          requires :id, type: Integer, desc: 'Question id.'
        end
        get ':id/answers' do
          authenticate!
          answers = Answer.where(question_id: params[:id])
          present answers, with: API::V1::Representers::AnswersRepresenter
        end

      end

      #get all questions
      resource :questions do

      end

      resource :lesson do

        desc "Return list of Questions for a particular lesson ID"
        params do
          requires :id, type: Integer, default: 1, desc: 'Lesson ID of Questions'
          optional :page, type: Integer, default: 1, desc: 'Number of questions to return.'
          optional :size, type: Integer, default: 3, desc: 'Number of questionss to return.'
        end
        get ':id/questions' do
          authenticate!
          questions = Question.where("lesson_id = ?", params[:id])
          present questions, with: API::V1::Representers::QuestionsRepresenter
        end

        desc "Return list of Questions for a particular lesson name"
        params do
          requires :n, type: String, default: 'SC.3.005.FORCE.MOVE', desc: 'Lesson Name of Questions'
          optional :page, type: Integer, default: 1, desc: 'Number of questions to return.'
          optional :size, type: Integer, default: 3, desc: 'Number of questionss to return.'
        end
        get 'questions' do
          authenticate!
          questions = Question.joins(:lesson).where("lessons.name = ?", params[:n])
          present questions, with: API::V1::Representers::QuestionsRepresenter
        end
      end

    end
  end
end
