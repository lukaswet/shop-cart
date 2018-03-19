class Product < ApplicationRecord
  has_many :comments
  has_many :images, as: :imagable, inverse_of: :imagable

  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, :price, presence: true
  validates_uniqueness_of :name
end
