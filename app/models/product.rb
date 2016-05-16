class Product < ActiveRecord::Base
  has_many :detail, :primary_key => "detail_id", :foreign_key  => "bhproduct_number", :class_name => "Detail"
end
