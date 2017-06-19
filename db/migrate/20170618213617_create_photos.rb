class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.text :caption

      t.integer :user_id
      t.integer :shop_id
      t.timestamps
    end
  end
end
