class AddUserToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :user_id, :bigint
  end
end
