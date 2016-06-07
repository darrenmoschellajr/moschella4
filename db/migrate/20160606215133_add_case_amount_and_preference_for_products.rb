class AddCaseAmountAndPreferenceForProducts < ActiveRecord::Migration
  def change
    add_column :products, :count_preference, :string
    add_column :products, :case_amount, :integer
  end
end
