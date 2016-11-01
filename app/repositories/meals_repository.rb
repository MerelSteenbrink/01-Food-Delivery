require_relative '../models/meal'
require 'csv'

class MealsRepository

  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def add(meal)
    meal.id = @next_id
    @meals << meal
    write_csv
    @next_id += 1
  end

  def all
    @meals
  end

  def find(meal_id)
    @meals.find { |element| element.id == meal_id }
  end

  private

#load_csv

def load_csv
  csv_options = { headers: :first_row, header_converters: :symbol }
  CSV.foreach(@csv_file, csv_options) do |row|
    @meals << build_element(row)
    @next_id += 1
  end
end



#write_to_csv
def write_csv
  return if @meals.empty?

  CSV.open(@csv_file, "w") do |csv|
    csv << ["id", "name", "price"]
    @meals.each do |element|
      csv << element.to_csv_row
    end
  end
end

def build_element(row)
    row[:id]    = row[:id].to_i          # Convert column to Fixnum
    row[:price] = row[:price].to_i       # Convert column to Fixnum
    Meal.new(row)
  end

end
