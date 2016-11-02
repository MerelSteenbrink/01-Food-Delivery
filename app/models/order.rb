class Order
  attr_accessor :id, :meal, :customer, :employee, :delivered

  def initialize(args={})
    @id = args[:id]
    @customer = args[:customer]
    @meal = args[:meal]
    @employee = args[:employee]
    @delivered = args[:delivered]
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end


end
