class CreatePermissionMatrices < ActiveRecord::Migration
  def change
    create_table :permission_matrices do |t|
    	t.integer :permission_id
    	t.integer :role_id
    	t.timestamps null: false
    end
  end
end
