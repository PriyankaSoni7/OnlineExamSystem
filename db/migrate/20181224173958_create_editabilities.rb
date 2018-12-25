class CreateEditabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :editabilities do |t|
      t.string :e_id
      t.string :activate
      t.string :deactivate
      t.string :add_new_ques
      t.string :add_option
      t.references :admin, index: true, foreign_key: true
      t.timestamps
    end
  end
end
