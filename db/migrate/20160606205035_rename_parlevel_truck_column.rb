class RenameParlevelTruckColumn < ActiveRecord::Migration
  def change
    rename_column :par_levels, :truck, :truck_id
    rename_column :par_levels, :product, :bhproduct_number
  end
end
