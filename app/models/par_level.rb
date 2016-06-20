class ParLevel < ActiveRecord::Base
  belongs_to :product, :foreign_key  => "bhproduct_number", :class_name => "Product"
  has_many :par_sheet
end
