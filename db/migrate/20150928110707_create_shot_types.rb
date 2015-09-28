class CreateShotTypes < ActiveRecord::Migration
  def change
    create_table :shot_types do |t|
    	t.integer :course_id
    	t.string :desc
        t.timestamps null: false
    end
  end
end
