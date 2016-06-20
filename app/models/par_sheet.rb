class ParSheet < ActiveRecord::Base
  belongs_to :truck
  belongs_to :par_levels
end
