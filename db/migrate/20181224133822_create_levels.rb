class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.string :id
      t.string :fresher
      t.string :intermediate
      t.string :experienced
      t.references :signup, index: true, foreign_key: true
      t.timestamps
    end
  end
end
