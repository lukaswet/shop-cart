class ChangeComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :user_id, :integer
    add_index :comments, :user_id

    remove_column :comments, :nickname, :string
  end
end
