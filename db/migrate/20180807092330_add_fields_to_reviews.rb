class AddFieldsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :user, index: true
    add_reference :reviews, :prep, index: true
  end
end
