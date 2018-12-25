class CreateQuestionSets < ActiveRecord::Migration[5.2]
  def change
    create_table :question_sets do |t|
      t.string :sub_id
      t.string :sub_name
      t.string :no_of_ques
      t.references :examinee, index: true, foreign_key: true 
      t.references :level, index: true, foreign_key: true
      t.references :editability, index: true, foreign_key: true 
      t.timestamps
    end
  end
end
