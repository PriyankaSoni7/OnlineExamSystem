class CreateExaminees < ActiveRecord::Migration[5.2]
  def change
    create_table :examinees do |t|
      t.string :id
      t.string :name
      t.string :address
      t.string :phone_no
      t.string :email
      t.references :admin, index: true, foreign_key: true
      t.references :list, index: true, foreign_key: true
      t.timestamps
    end
  end
end
