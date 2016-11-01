class MealsView

  def list(meals)
    p "There are #{meals.length} meals in the menu:"
    meals.each do |meal|
    puts "#{meal.id} - #{meal.name} - #{meal.price}"
    end
  end

  def ask_name
    p "What's the name of the meal you want to add?"
    name = gets.chomp
  end

  def ask_price
    p "what's the price of the meal you want to add?"
    price = gets.chomp
  end

end
