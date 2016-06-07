class ParLevel < ActiveRecord::Base
  belongs_to :truck
  belongs_to :product, :foreign_key  => "bhproduct_number", :class_name => "Product"
end
