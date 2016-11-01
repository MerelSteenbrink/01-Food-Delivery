class Employee
  attr_reader :username, :role, :password
  attr_accessor :id

  def initialize(args={})
    @id = args[:id]
    @username = args[:username]
    @password = args[:password]
    @role = args[:role]
  end

  def to_csv_row
    [@id, @username, @password, @role]
  end

  def manager?
    @role == "manager"
  end

  def delivery_guy?
    @role == "delivery_guy"
  end
end


