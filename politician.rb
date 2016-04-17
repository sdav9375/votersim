require './format.rb'

class Politician
  attr_accessor :name, :party, :create_politician

  @@politician = []

  def initialize(name, party)
    @name = name
    @party = party
    # @@politician << self #[name] = party
  end

  def self.create_politician
    puts "Enter the name of the politician."
    prompt
    name = gets.chomp.split.map(&:capitalize).join(' ')
    # if name.nil?
    puts "What is #{name}'s party? (D)emocrat, (R)epublican, or (I)ndependent"
    prompt
    party = gets.chomp.downcase
    continue = false
    until continue
      case party
      when "d"
        party = "Democrat"
        continue = true
        puts "You have set #{name} as a Democrat"
      when "r"
        party = "Republican"
        continue = true
        puts "You have set #{name} as a Republican"
      when "i"
        party = "Independent"
        continue = true
        puts "You have set #{name} as an Independent"
      else
        puts "That is not a choice. Please try again."
        create_politician
      end
    end
    # Politician.new("#{name}", "#{party}")
    @@politician << Politician.new("#{name}", "#{party}")

    puts "You added #{name}, #{party}, to the politician database."
    show_line

    Politician.list

    # main_menu
  end

  def self.update_politician
  puts "Here is the current list of Politicians"
  Politician.list
  puts "Enter the name of the politician you would like to update."
  prompt
  name = gets.chomp
  # if name.nil?
  puts "What is #{name}'s party? (D)emocrat, (R)epublican, or (I)ndependent"
  prompt
  party = gets.chomp.downcase
  continue = false
  until continue
    case party
    when "d"
      party = "Democrat"
      continue = true
      puts "You have set #{name} as a Democrat"
    when "r"
      party = "Republican"
      continue = true
      puts "You have set #{name} as a Republican"
    when "i"
      party = "Independent"
      continue = true
      puts "You have set #{name} as an Independent"
    else
      puts "That is not a choice. Please choose D for Democrat, R for Republican,
      or I for Independent."
    end
  end
  Politician.new("#{name}", "#{party}")
  puts "You added #{name}, #{party}, to the politician database."
  show_line

  Politician.list
  main_menu


  end

  # def self.delete_politician
  # Politician.list
  # end

  def self.list
    puts "All politicians in the database:"
    # puts @@politician
    @@politician.each {|x|
      puts "Politician, #{x.name}, #{x.party}"
    }
    show_line
  end
end




# Politician.list



# def self.save
#   puts "#{@@politician}"
#   puts "_____________________________"
#
# end

# require './person.rb'
#
# class Politician < Person
#   attr_accessor :party
#
#   def initialize
#     @name = name
#     @affiliation = affiliation
#   end
#
#
#
#
#
# end
