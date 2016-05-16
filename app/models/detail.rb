class Detail < ActiveRecord::Base
  belongs_to :inventorysession
  belongs_to :product, :foreign_key  => "bhproduct_number", :class_name => "Product"
end
