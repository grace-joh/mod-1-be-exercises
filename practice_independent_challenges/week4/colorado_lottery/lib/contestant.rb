class Contestant
  attr_reader :first_name,
              :last_name,
              :age,
              :state_of_residence,
              :spending_money

  def initialize(contestant_details)
    @first_name = contestant_details.fetch(:first_name, nil)
    @last_name = contestant_details.fetch(:last_name, nil)
    @age = contestant_details.fetch(:age, nil)
    @state_of_residence = contestant_details.fetch(:state_of_residence, nil)
    @spending_money = contestant_details.fetch(:spending_money, nil)
  end
end
