class AddCounttypeToParlevels < ActiveRecord::Migration
  def change
    add_column :par_levels, :count_type, :string
  end
end
