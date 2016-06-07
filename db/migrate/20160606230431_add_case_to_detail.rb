class AddCaseToDetail < ActiveRecord::Migration
  def change
    add_column :details, :count_type, :string
  end
end
