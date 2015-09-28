class CreateQCategories < ActiveRecord::Migration
  def change
    create_table :q_categories do |t|
 	  t.integer :q_id
 	  t.integer :category_id
      t.timestamps null: false
    end
  end
end
