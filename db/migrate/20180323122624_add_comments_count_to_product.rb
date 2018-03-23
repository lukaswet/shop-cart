class AddCommentsCountToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :comments_count, :integer, default: 0
  end
end
