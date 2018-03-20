class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :text, :product, presence: true
  validates :text, length: { maximum: 200 }
end
