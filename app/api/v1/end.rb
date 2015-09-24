require_relative 'helpers'
module API
	module V1
		class End < Grape::API
			format :json
			helpers API::V1::Helpers
			

			get 'lala' do 
				array  = Helpers.ll("yolomofo")
				array
				
			end
			get 'yolo' do
				config = Rails.configuration.database_configuration[Rails.env]
				ar = Rose.first
				

				{"aray" => ar,"database" => config["database"],"host" => config["host"]}
			end

			
			get 'dbtest' do 
				config   = Rails.configuration.database_configuration[Rails.env]

				{"database" => config["database"],"host" => config["host"]}
			end

			
		end
	end
end