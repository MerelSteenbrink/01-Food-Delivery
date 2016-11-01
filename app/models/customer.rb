class Customer
  attr_reader :name, :address
  attr_accessor :id

  def initialize(args={})
    @id = args[:id]
    @name = args[:name]
    @address = args[:address]
  end

  def to_csv_row
    [@id, @name, @address]
  end


end


