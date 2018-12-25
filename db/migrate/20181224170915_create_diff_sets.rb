class CreateDiffSets < ActiveRecord::Migration[5.2]
  def change
    create_table :diff_sets do |t|
      t.string :id
      t.string :easy
      t.string :medium
      t.string :difficult
      t.references :question_set, index: true, foreign_key: true
      t.timestamps
    end
  end
end
