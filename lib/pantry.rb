require './lib/ingredient'
require './lib/recipe'

class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    answer = false
    recipe.ingredients_required.each do |ingredient|
      if stock_check(ingredient) >= ingredient[1]
        answer = true
      else
        answer = false
      end
    end
    answer
  end


end
