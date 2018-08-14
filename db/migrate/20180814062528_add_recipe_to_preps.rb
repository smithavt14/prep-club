class AddRecipeToPreps < ActiveRecord::Migration[5.2]
  def change
    add_column :preps, :recipe_name, :string
    add_column :preps, :recipe_url, :string
    add_column :preps, :recipe_ingredients, :text
  end
end
