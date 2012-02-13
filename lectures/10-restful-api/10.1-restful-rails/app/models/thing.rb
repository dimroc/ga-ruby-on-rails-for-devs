class Thing < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  
  def to_s
    "#{name} (#{description})"
  end
end

