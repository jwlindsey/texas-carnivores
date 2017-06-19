class AddPictureToPhoto < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :picture, :string
  end
end
