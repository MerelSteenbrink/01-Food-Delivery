class EmployeesRepository

  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end


  def all
    @employees
  end

  def all_delivery_guys
    @employees.select{|employee| employee.role == "delivery_guy"}
  end

  def find(employee_id)
    @employees.find { |element| element.id == employee_id }
  end

  def find_by_username(username)
    @employees.find { |element| element.username == username }
  end

  private

#load_csv

def load_csv
  csv_options = { headers: :first_row, header_converters: :symbol }
  CSV.foreach(@csv_file, csv_options) do |row|
    @employees << build_element(row)
    @next_id += 1
  end
end



#write_to_csv
def write_csv
  return if @employees.empty?

  CSV.open(@csv_file, "w") do |csv|
    csv << ["id", "username", "password", "role"]
    @employees.each do |element|
      csv << element.to_csv_row
    end
  end
end

def build_element(row)
    row[:id]    = row[:id].to_i          # Convert column to Fixnum
    Employee.new(row)
  end

end


