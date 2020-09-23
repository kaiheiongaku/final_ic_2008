require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def test_it_exists_and_can_stock_ingredients

    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
    assert_equal ({}), pantry.stock

    pantry.stock_check(ingredient1)
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    pantry.restock(ingredient2, 7)

    assert_equal 15, pantry.stock_check(ingredient1)
    assert_equal 7, pantry.stock_check(ingredient2)
  end
end
