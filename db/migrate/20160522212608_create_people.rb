class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.integer :group
      t.string :email

      t.timestamps null: false
    end
  end
end
