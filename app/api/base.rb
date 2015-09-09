module API
	class Base < Grape::API
		format :json
		
		get 'lala' do 
			array  = [1,2,3,4]
			
		end
		
	end
end