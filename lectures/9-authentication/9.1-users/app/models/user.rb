class User < ActiveRecord::Base
  attr_accessible :name, :email
  validates_uniqueness_of :email
  validates_presence_of :email
  validates :email, :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates_presence_of :name
end

