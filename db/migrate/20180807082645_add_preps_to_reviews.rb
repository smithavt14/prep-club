class AddPrepsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :prep_id, :bigint
  end
end
