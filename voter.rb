require './format.rb'

class Voter
  attr_accessor :name, :affiliation, :create_voter

  @@voter = []

  def initialize(name, affiliation)
    @name = name
    @affiliation = affiliation
    # @@voter << self #[name] = party
  end

  def self.create_voter
    puts "Enter the name of the voter."
    prompt
    name = gets.chomp.split.map(&:capitalize).join(' ')
    # if name.nil?
    puts "What is #{name}'s affiliation? (C)onservative, (L)iberal, (T)ea Party, (S)ocialist, (N)eutral"
    prompt
    affiliation = gets.chomp.downcase
    # affiliation = {"c": "Conservative", "l": "Liberal", "t": "Tea Party", "s": "Socialist", "n": "Neutral"}
    continue = false
    until continue
      case affiliation
      when "c"
        continue = true
        affiliation = "Conservative"
        puts "You have set #{name} as a #{affiliation}"
      when "l"
        continue = true
        affiliation = "Liberal"
        puts "You have set #{name} as a #{affiliation}"
      when "t"
        continue = true
        affiliation = "Tea Party"
        puts "You have set #{name} as a #{affiliation} member"
      when "s"
        continue = true
        affiliation = "Socialist"
        puts "You have set #{name} as a #{affiliation}"
      when "n"
        continue = true
        affiliation = "Neutral"
        puts "You have set #{name} as #{affiliation}"
      else
        puts "That is not a choice. Please try again."
        create_voter
      end
    end
    # end
    @@voter << Voter.new("#{name}", "#{affiliation}")
    puts "You added #{name}, #{affiliation}, to the voter database."
    show_line
    Voter.list

  end

  def self.list
    puts "All voters in the database:"
    show_line
    @@voter.each {|x|
      puts "Voter, #{x.name}, #{x.affiliation}"
    }
    show_line
  end
end




# Voter.list


#
# class Voter
#   attr_accessor :name, :affiliation
#
#   def initialize(name, affiliation)
#     @voter = {}
#     @name = name
#     @affiliation = affiliation
#     @voter[name] = affiliation
#   end
#
# end
#



# require './person.rb'
#
# class Voter < Person
#   attr_accessor :affiliation
#
#   def initialize
#     @affiliation = affiliation
#   end
#
# end
