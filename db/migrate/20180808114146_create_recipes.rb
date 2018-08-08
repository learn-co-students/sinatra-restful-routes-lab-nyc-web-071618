class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.integer :cook_time
    end
  end
end

#Creates a table in database to store recipes
#Recipes have a name, ingredients (written as one string), cook time
