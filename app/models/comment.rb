class Comment < ApplicationRecord
  belongs_to :product

  validates :nickname, :text, :product, presence: true
  validates :nickname, length: { in: 2..20 }
  validates :text, length: { maximum: 200 }
end
