class Reunion
  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    reunion_total = 0
    @activities.each { |activity| reunion_total += activity.total_cost }
    reunion_total
  end

  def total_owed
    each_owed = Hash.new(0)
    @activities.each do |activity|
      activity.owed.each { |participant, amount_owed| each_owed[participant] += amount_owed }
    end
    each_owed
  end

  def print_summary
    puts "#{@name} Reunion Summary"
    total_owed.each do |participant, amount_owed|
      if amount_owed >= 0
        puts "#{participant}: $#{'%.2f' % amount_owed}"
      else
        puts "#{participant}: -$#{'%.2f' % -amount_owed }"
      end
    end
  end
end
