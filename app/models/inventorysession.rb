class Inventorysession < ActiveRecord::Base
  belongs_to :truck
  has_many :detail
end
