require './lib/dish'

class Potluck
  attr_reader :date, :dishes 
  
  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.select{ |dish| dish.category == category}
  end

  def menu
    menu = Hash.new 
    @dishes.each {|dish| menu[dish.category] = [] }
    menu.each do | category, items |
      menu[category] = get_all_from_category(category).map{ |dish| dish.name }
    end
    menu
  end

  def ratio(category)
    (get_all_from_category(category).length / @dishes.length.to_f * 100).round(1)
  end
end