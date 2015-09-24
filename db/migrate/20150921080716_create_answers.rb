class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.integer :question_id
    	t.string :correct_answer
    	t.integer :choice_order
    	t.integer :choice_label
    	t.string :choice_media_url
    	t.string :choice_selected_media_url
    	t.string :answer_name
    	t.string :question_name
        t.timestamps null: false
    end
  end
end
