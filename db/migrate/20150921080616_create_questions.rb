class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.string :question_name
    	t.string :stem_media_url
    	t.string :question_type
    	t.string :layout
    	t.string :media_url 
    	t.string :subject
    	t.integer :grade
    	t.string :assessment_type
    	t.integer :level
    	t.integer :display_order
    	

        t.timestamps null: false
    end
  end
end
