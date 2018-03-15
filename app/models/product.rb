class Product < ApplicationRecord
  has_many :comments

  validates :name, :price, presence: true
  validates_uniqueness_of :name
end
