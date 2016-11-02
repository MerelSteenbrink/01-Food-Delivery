require_relative '../models/order.rb'
require 'csv'

class OrdersRepository
  def initialize(csv_file, meals_repository, employees_repository, customers_repository)
    @csv_file = csv_file
    @meals_repository = meals_repository
    @employees_repository = employees_repository
    @customers_repository = customers_repository
    @orders = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def add(order)
    order.id = @next_id
    @orders << order
    @next_id += 1
    write_csv
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def save
    write_csv
  end

  private

  def load_csv
    @orders
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      order = build_order(row)
      @orders << order
      @next_id += 1
    end
  end

  def write_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << %w(id delivered meal_id employee_id customer_id)
      @orders.each do |order|
        csv << [order.id, order.delivered?, order.meal.id, order.employee.id, order.customer.id]
      end
    end
  end

  def build_order(row)
    row[:id] = row[0].to_i                          # Convert column to Fixnum
    row[:delivered] = row[1] == "true"       # Convert column to Fixnum
    row[:meal] = @meals_repository.find(row[2].to_i)
    row[:employee] = @employees_repository.find(row[3].to_i)
    row[:customer] = @customers_repository.find(row[4].to_i)
    Order.new(row)
  end
end

