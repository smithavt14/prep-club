class AddImageLinkToPreps < ActiveRecord::Migration[5.2]
  def change
    remove_column :preps, :photo_url
    add_column :preps, :image_link, :string
  end
end
