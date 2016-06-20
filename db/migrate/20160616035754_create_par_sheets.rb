class CreateParSheets < ActiveRecord::Migration
  def change
    create_table :par_sheets do |t|
      t.string :day
      t.integer :truck_id

      t.timestamps null: false
    end
    remove_column :par_levels, :truck_id
    remove_column :par_levels, :day
  end
end
