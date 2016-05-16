class RenameSessionidColToInventorysessionid < ActiveRecord::Migration
  def change
    rename_column :details, :session_id, :inventorysession_id
  end
end
