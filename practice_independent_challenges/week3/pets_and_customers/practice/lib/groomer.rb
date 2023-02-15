class Groomer
  attr_reader :name, :customers, :services, :charges

  def initialize(name)
    @name = name
    @customers = []
    @services = {}
    @charges = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def customers_with_unpaid_balance
    @customers.select { |customer| customer.outstanding_balance.positive? }
  end

  def count_by_type(pet_type)
    count = 0
    @customers.each do |customer|
      customer.pets.each { |pet| count += 1 if pet.type.to_s == pet_type }
    end
    count
  end

  def add_service(service_type, fee)
    @services[service_type] = fee
    @services
  end

  def add_charge(type, customer, pet)
    charge_hash = {
      type: type,
      cost: @services[type],
      customer: customer,
      pet: pet
    }
    @charges << charge_hash
  end
end
