class User < ActiveRecord::Base
  has_many :reviews
  has_many :ratings
  validates :name, :presence => true, :uniqueness => true
  has_secure_password
end
