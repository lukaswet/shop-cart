class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :file
      t.integer :imagable_id
      t.integer :imagable_type

      t.timestamps
    end
  end
end
