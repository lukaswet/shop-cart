class Product < ApplicationRecord
  has_many :comments
  has_many :commented_users, through: :comments, source: :user
  has_many :uniq_commented_users, -> { uniq },
           through: :comments, source: :user

  has_many :images, as: :imagable, inverse_of: :imagable

  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, :price, presence: true
  validates_uniqueness_of :name
end
