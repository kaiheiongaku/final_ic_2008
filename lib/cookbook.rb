require './lib/recipe'

class Cookbook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def total_calories
    @recipes.each do |recipe|
end
