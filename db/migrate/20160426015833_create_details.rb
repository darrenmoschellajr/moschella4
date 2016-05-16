class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :bhproduct_number, null: false
      t.integer :quantity, null: false
      t.integer :session_id, null: false

      t.timestamps null: false
    end
  end
end
