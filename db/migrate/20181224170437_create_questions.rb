class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :ques_no
      t.string :first_option
      t.string :second_option
      t.string :third_option
      t.string :fourth_option
      t.string :answer
      t.string :time_limit
      t.references :diff_set, index: true, foreign_key: true
      t.references :editability, index: true, foreign_key: true
      t.timestamps
    end
  end
end
