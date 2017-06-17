class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :message
      t.string :rating
      t.integer :user_id
      t.integer :shop_id
      t.timestamps
    end

    add_index :comments, [:user_id, :shop_id]
    add_index :comments, :shop_id
  end
end
