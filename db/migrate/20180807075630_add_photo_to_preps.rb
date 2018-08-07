class AddPhotoToPreps < ActiveRecord::Migration[5.2]
  def change
    add_column :preps, :photo, :string
  end
end
