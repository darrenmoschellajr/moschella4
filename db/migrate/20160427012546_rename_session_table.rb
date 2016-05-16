class RenameSessionTable < ActiveRecord::Migration
  def change
    rename_table :sessions, :inventorysessions
  end
end
