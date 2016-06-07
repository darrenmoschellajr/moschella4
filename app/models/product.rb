class Product < ActiveRecord::Base
  has_many :detail, :primary_key => "detail_id", :foreign_key  => "bhproduct_number", :class_name => "Detail"
  has_many :par_level, :primary_key => "par_level_id", :foreign_key => "bhproduct_number", :class_name => "ParLevel"
end
