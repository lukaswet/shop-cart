class AddLikesToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :like, :text
  end
end
