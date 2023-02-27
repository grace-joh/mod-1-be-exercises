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

  def print_detailed_summary
    puts "#{@name} Reunion Detailed Summary"
    detailed_summary_hash.each do |participant, activity_hash|
      puts "- #{participant} -"
      activity_hash.each do |activity, amount_owed|
        if amount_owed > 0
          puts "#{activity}: You owe $#{'%.2f' % amount_owed}"
        elsif amount_owed < 0
          puts "#{activity}: You are owed $#{'%.2f' % -amount_owed}"
        else
          puts "#{activity}: You're good!"
        end
      end
    end
  end

  def detailed_summary_hash
    details = {}
    @activities.each do |activity|
      activity.participants.each do |participant|
        details[participant[0]] = {}
      end
    end
    @activities.each do |activity|
      activity.participants.each do |participant|
        details[participant[0]][activity.name] = activity.split - participant[1]
      end
    end
    details
  end
end
