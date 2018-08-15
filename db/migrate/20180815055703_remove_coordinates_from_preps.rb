class RemoveCoordinatesFromPreps < ActiveRecord::Migration[5.2]
  def change
    remove_column :preps, :latitude
    remove_column :preps, :longitude
  end
end
