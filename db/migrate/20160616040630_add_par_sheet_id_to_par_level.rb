class AddParSheetIdToParLevel < ActiveRecord::Migration
  def change
    add_column :par_levels, :par_sheets_id, :integer
  end
end
