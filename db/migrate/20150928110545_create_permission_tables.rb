class CreatePermissionTables < ActiveRecord::Migration
  def change
    create_table :permission_tables do |t|
    	t.string :name
    	t.timestamps null: false
    end
  end
end
