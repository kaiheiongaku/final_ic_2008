require './lib/cookbook'
require 'minitest/autorun'
require 'minitest/pride'

class CookbookTest < Minitest::Test

  def test_it_exists_and_can_add_recipes
    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")
    cookbook = Cookbook.new

    assert_instance_of Cookbook, cookbook
    assert_equal [], cookbook.recipes

    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    cookbook.recipes

    assert_equal [recipe1, recipe2], cookbook.recipes
  end

  def test_ingredients_and_highest_calorie_meal
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    recipe2 = Recipe.new("Cheese Burger")
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)
    cookbook = Cookbook.new
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    expected = ["Cheese", "Macaroni", "Ground Beef", "Bun"],
    actual = cookbook.ingredients

    assert_equal recipe2, cookbook.highest_calorie_meal
  end
end
