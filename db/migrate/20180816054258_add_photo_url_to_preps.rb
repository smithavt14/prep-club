class AddPhotoUrlToPreps < ActiveRecord::Migration[5.2]
  def change
    add_column :preps, :photo_url, :string
  end
end
