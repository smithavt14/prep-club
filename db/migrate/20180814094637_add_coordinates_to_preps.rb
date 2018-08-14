class AddCoordinatesToPreps < ActiveRecord::Migration[5.2]
  def change
    add_column :preps, :latitude, :float
    add_column :preps, :longitude, :float
  end
end
