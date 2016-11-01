require_relative "../models/customer.rb"
require_relative "../views/customers_view.rb"


class CustomersController
  def initialize(customers_repository)
    @customers_repository = customers_repository
    @view = CustomersView.new
  end

  # List all customers available in restaurant
  def list
    customers = @customers_repository.all
    @view.list(customers)
  end

  # Add a new customer
  def add
    customer_name = @view.ask_name
    customer_address = @view.ask_address
    new_customer = Customer.new({name: customer_name, address: customer_address})
    @customers_repository.add(new_customer)
  end
end
