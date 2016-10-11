require_relative "../models/meal.rb"
require_relative "../views/meals_view.rb"

require_relative "../models/meal.rb"
require_relative "../views/meals_view.rb"

class MealsController
  def initialize(meals_repository)
    @meals_repository = meals_repository
    @view = MealsView.new
  end

  # List all meals available in restaurant
  def list
    meals = @meals_repository.all
    @view.list(meals)
  end

  # Add a new meal
  def add
    meal_name = @view.ask_name
    meal_price = @view.ask_price.to_i
    new_meal = Meal.new({name: meal_name, price: meal_price})
    @meals_repository.add(new_meal)
  end
end
