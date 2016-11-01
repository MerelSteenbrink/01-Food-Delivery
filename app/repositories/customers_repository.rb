require_relative '../models/customer'
require 'csv'

class CustomersRepository

  def initialize(csv_file)
    @csv_file = csv_file
    @customers = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def add(customer)
    customer.id = @next_id
    @customers << customer
    write_csv
    @next_id += 1
  end

  def all
    @customers
  end

  def find(customer_id)
    @customers.find { |element| element.id == customer_id }
  end

  private

#load_csv

def load_csv
  csv_options = { headers: :first_row, header_converters: :symbol }
  CSV.foreach(@csv_file, csv_options) do |row|
    @customers << build_element(row)
    @next_id += 1
  end
end



#write_to_csv
def write_csv
  return if @customers.empty?
  csv_options = { headers: :first_row, header_converters: :symbol }

  CSV.open(@csv_file, "wb", csv_options) do |csv|
    csv << ["id", "name", "address"]
    @customers.each do |element|
      csv << element.to_csv_row
    end
  end
end

def build_element(row)
    row[:id]    = row[0].to_i          # Convert column to Fixnum
    row[:name] = row[1]
    row[:address] = row[2]
    Customer.new(row)
  end

end
