class CreateParLevels < ActiveRecord::Migration
  def change
    create_table :par_levels do |t|
      t.integer :truck
      t.integer :product
      t.string :day
      t.integer :parlevel

      t.timestamps null: false
    end
  end
end
