class CreateSignups < ActiveRecord::Migration[5.2]
  def change
    create_table :signups do |t|
      t.string :id
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone_no
      t.string :college_name

      t.timestamps
    end
  end
end
