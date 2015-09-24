class CreateAnswerTexts < ActiveRecord::Migration
  def change
    create_table :answer_texts do |t|
    	t.integer :answer_id
    	t.integer :language_id
    	t.text :answer_text
        t.timestamps null: false
    end
  end
end
