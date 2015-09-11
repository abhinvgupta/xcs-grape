class CreateRoses < ActiveRecord::Migration
  def change
    create_table :roses do |t|
      t.text :name
      t.integer :size
      t.timestamps null: false
    end
  end
end
