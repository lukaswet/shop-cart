class Comment < ApplicationRecord
  belongs_to :product, counter_cache: true
  belongs_to :user

  validates :text, :product, presence: true
  validates :text, length: { maximum: 200 }

  def as_json(_ = nil)
    {
        id: id,
        product_id: product_id,
        user_id: user_id,
        text: text,
        nick: user_full_name || 'Guest'
    }
  end
  
  private

end
