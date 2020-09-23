require './lib/ingredient'

class Recipe
  attr_reader :name,
              :ingredients_required,
              :ingredients

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] += amount
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories

    ingredients.map do |ingredient|
      ingredient.calories * @ingredients_required[ingredient]
    end.sum
  end



end
