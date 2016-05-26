class Person < ActiveRecord::Base
  belongs_to :user, :foreign_key => "email", :class_name => "User"
end
