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

  def test_total_calories
    
end
