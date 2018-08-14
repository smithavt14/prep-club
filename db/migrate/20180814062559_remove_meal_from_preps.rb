class RemoveMealFromPreps < ActiveRecord::Migration[5.2]
  def change
    remove_column :preps, :meal
  end
end
