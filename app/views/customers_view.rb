class CustomersView

  def list(customers)
    p "There are #{customers.length} customers:"
    customers.each do |customer|
    puts "#{customer.id} - #{customer.name} - #{customer.address}"
    end
  end

  def ask_name
    p "What's the name of the customer you want to add?"
    name = gets.chomp
  end

  def ask_address
    p "what's the address of the customer you want to add?"
    price = gets.chomp
  end

end
