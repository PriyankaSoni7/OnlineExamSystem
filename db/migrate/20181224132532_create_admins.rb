class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :address
      t.string :phone_no
     
      t.timestamps
    end
  end
end
