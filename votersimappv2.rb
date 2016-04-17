require './politician.rb'
require './voter.rb'
require './format.rb'
# # require './questions.rb'


class VoterSim
  attr_accessor :politician, :voter

  def initialize
    # Politician.new << self
    # Voter.new << self
    start
  end



  def user_input(question, options=[], *possible_answers)
    answer = nil
    until answer
      puts question
      prompt
      input = gets.chomp.downcase
      possible_answers.each_with_index do |user_answer,index|
        if input == user_answer
          answer = index
        end
      end
    end
    send(options[answer])
    main_menu
    # puts "here is the answer! #{answer}"
  end

  def main_menu
    user_input('What would you like to do? (C)reate, (L)ist, (U)pdate, or (D)elete',
    [:create, :list, :update, :delete], "c", "l", "u", "d")
  end

  def rejection1
    puts "That is not an option. Please type either 'p' or 'v'"
  end

  def start
    puts "*********************************"
    puts 'Welcome to the Voter Sim database'
    puts "*********************************"
    main_menu
  end

  def create
    # user_input('Would you like to create a (P)olitician or (V)oter?',
    # [:politician, :voter], "p", "v")
    puts "Would you like to create a (P)olitician or (V)oter?"
    answer = gets.chomp.downcase
    continue = false
    until continue
      if answer == "p"
        continue = true
        # p :politician
        Politician.create_politician
      elsif answer == "v"
        # p :voter
        continue = true
        Voter.create_voter
      else
        rejection1
        create
      end
    end
  end

  def list
    Politician.list
    Voter.list
    main_menu
  end


  def update
    puts "Would you like to update a (P)olitician or (V)oter?"
    answer = gets.chomp.downcase
    continue = false
    until continue
      if answer == "p"
        continue = true
        # p :politician
        Politician.update_politician
      elsif answer == "v"
        # p :voter
        continue = true
        Voter.update_voter
      else
        rejection1
        update
      end
    end
  end
  




  # def delete
    # Tip! Show a list to the user before deleting.
    #
    # Who would you like to delete?
    # Marco Rubio
    # If the name matches a known person, it should delete that person.
    #
    # Are you sure?
    # (Y) es

  #   user_input('Would you like to delete a (P)olitician or (V)oter',
  #   [:politician, :voter], "p", "v")
  #
  #   if :politician  #experiment
  #     Politician.delete_politician
  #   else :voter
  #     Voter.delete_voter #experiment
  #   end
  #   main_menu
  # end
end


VoterSim.new

# def politician
#   puts "Enter the name of the politician."
#   prompt
#   name = gets.chomp
#   # if name.nil?
#   puts "What is #{name}'s party? (D)emocrat, (R)epublican, or (I)ndependent"
#   prompt
#   party = gets.chomp.downcase
#   #   continue = false
#   #   until continue
#   #     case party
#   #     when "d"
#   #       puts "You have set #{name} as a Democrat"
#   #     when "r"
#   #       puts "You have set #{name} as a Republican"
#   #     when "i"
#   #       puts "You have set #{name} as an Independent"
#   #     else
#   #       puts "That is not a choice. Please choose D for Democrat, R for Republican,
#   #       or I for Independent."
#   #     end
#   #   end
#   # end
#   Politician.new("#{name}", "#{party}")
#   puts "You added #{name}, #{party}, to the politician database."
#   show_line
#   Politician.list
#   main_menu
# end

# def voter
#   puts "Enter the name of the voter."
#   prompt
#   name = gets.chomp
#   # if name.nil?
#   puts "What is #{name}'s affiliation? (C)onservative, (L)iberal, (T)ea Party, (S)ocialist, (N)eutral"
#   prompt
#   affiliation = gets.chomp.downcase
#   # affiliation = {"c": "Conservative", "l": "Liberal", "t": "Tea Party", "s": "Socialist", "n": "Neutral"}
#   continue = false
#   until continue
#     case affiliation
#     when "c"
#       continue = true
#       affiliation = "Conservative"
#       puts "You have set #{name} as a #{affiliation}"
#     when "l"
#       continue = true
#       affiliation = "Liberal"
#       puts "You have set #{name} as a #{affiliation}"
#     when "t"
#       continue = true
#       affiliation = "Tea Party"
#       puts "You have set #{name} as a #{affiliation} member"
#     when "s"
#       continue = true
#       affiliation = "Socialist"
#       puts "You have set #{name} as a #{affiliation}"
#     when "n"
#       continue = true
#       affiliation = "Neutral"
#       puts "You have set #{name} as #{affiliation}"
#     else
#       puts "That is not a choice. Please choose C for Conservative, L for Liberal, T for Tea Party,
#       S for Socialist, N for Neutral"
#     end
#   end
#   # end
#   Voter.new("#{name}", "#{affiliation}")
#   puts "You added #{name}, #{affiliation}, to the voter database."
#   show_line
#   Voter.list
#   main_menu
# end



# choice = gets.chomp.downcase
# continue = false
# until continue
#   case choice
#   when 'c'
#     create_record
#   when 'l'
#     list_records
#   when 'u'
#     update_records
#   when 'd'
#     delete_record
#   else
#     puts 'That is not a valid entry. Please type C for create, L for list, U for update, or D for delete.'
#   end
#


#get input
#do work
#return results
#
# movies = {
#   Memento: 3,
#   Primer: 4,
#   Ishtar: 1
# }
#
# puts "What would you like to do?"
# puts "-- Type 'add' to add a movie."
# puts "-- Type 'update' to update a movie."
# puts "-- Type 'display' to display all movies."
# puts "-- Type 'delete' to delete a movie."
#
# choice = gets.chomp.downcase
# case choice
# when 'add'
#   puts "What movie do you want to add?"
#   title = gets.chomp
#   if movies[title.to_sym].nil?
#     puts "What's the rating? (Type a number 0 to 4.)"
#     rating = gets.chomp
#     movies[title.to_sym] = rating.to_i
#     puts "#{title} has been added with a rating of #{rating}."
#   else
#     puts "That movie already exists! Its rating is #{movies[title.to_sym]}."
#   end
# when 'update'
#   puts "What movie do you want to update?"
#   title = gets.chomp
#   if movies[title.to_sym].nil?
#     puts "Movie not found!"
#   else
#     puts "What's the new rating? (Type a number 0 to 4.)"
#     rating = gets.chomp
#     movies[title.to_sym] = rating.to_i
#     puts "#{title} has been updated with new rating of #{rating}."
#   end
# when 'display'
#   movies.each do |movie, rating|
#     puts "#{movie}: #{rating}"
#   end
# when 'delete'
#   puts "What movie do you want to delete?"
#   title = gets.chomp
#   if movies[title.to_sym].nil?
#     puts "Movie not found!"
#   else
#     movies.delete(title.to_sym)
#     puts "#{title} has been removed."
#   end
# else
#   puts "Sorry, I didn't understand you."
# end
