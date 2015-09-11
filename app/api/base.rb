module API
	class Base < Grape::API
		format :json
		
		get 'lala' do 
			array  = [1,2,3,4,5,6]
			{"This is a test array" => array}
			
		end
		get 'front' do 
			{"lname" => params["lastname"],"fname" => params["firstname"]}
		end
		get 'yolo' do
			config   = Rails.configuration.database_configuration[Rails.env]
			host     = config["host"]
			database = config["database"]
			username = config["username"]
			password = config["password"]
			{"host" => host, "database" => database, "username" => username, "password" => password}

		end

		resource 'permissions' do 
			get 'tableadd' do
				params do
					requires :module,type: :string
					requires :act,type: :string
				end
				mod = params[:module]
				act = params[:act]
				name = mod + "." + act
				PermissionTable.create(:name => name)
			end
			post 'matrixadd' do
				params do
					requires :module,type: :string
					requires :act,type: :string
					requires :role,type: :string
				end
				pername = params[:module] + "." + params[:act]
				
				per_id = PermissionTable.where(:name => pername).pluck(:id)
				roleid = Role.where(:name => params[:role]).pluck(:id)
				if !per_id.nil? && !roleid.nil?
					PermissionMatrix.create(:role_id => roleid[0],:permission_id => per_id[0])
				
				else
					{:error => "enter params"}
				end
				
			end
		end
	end
end