class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :l_id
      t.string :marks
      t.string :pass
      t.string :fail
      t.references :examinee, index: true, foreign_key: true
      t.timestamps
    end
  end
end
