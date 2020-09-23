require './lib/ingredient'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'

class RecipeTest < Minitest::Test

  def test_it_exists_and_has_attributes
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    recipe1 = Recipe.new("Mac and Cheese")
    assert_instance_of Recipe, recipe1
    assert_equal "Mac and Cheese", recipe1.name
    assert_equal ({}), recipe1.ingredients_required
  end

  def test_add_ingredients
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)

    expected = ({ingredient1 => 6, ingredient2 => 8})
    actual = recipe1.ingredients_required

    assert_equal expected, actual
    assert_equal [ingredient1, ingredient2], recipe1.ingredients
  end
end
