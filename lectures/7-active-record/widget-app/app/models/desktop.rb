class Desktop < ActiveRecord::Base
  has_many :widgets, as: :displayable
end
