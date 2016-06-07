class Truck < ActiveRecord::Base
  has_many :inventorysession
  has_many :par_level
end
