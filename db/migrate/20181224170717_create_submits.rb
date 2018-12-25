class CreateSubmits < ActiveRecord::Migration[5.2]
  def change
    create_table :submits do |t|
      t.string :no_of_ques_attempt

      t.timestamps
    end
  end
end
