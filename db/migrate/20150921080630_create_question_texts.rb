class CreateQuestionTexts < ActiveRecord::Migration
  def change
    create_table :question_texts do |t|
    	t.integer :question_id
    	t.integer :language_id
    	t.text :stem_text
    	
      	t.timestamps null: false
    end
  end
end
