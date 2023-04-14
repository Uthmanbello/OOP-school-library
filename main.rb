#!/usr/bin/env ruby
require 'date'
require './app'

def main
  app = App.new()

  loop do
    puts "\nWelcome to School Library App!"
    puts "\nPlease choose an option by entering a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person id"
    puts "7 - Exit"

    option = gets.chomp.to_i

    case option
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      puts "Do you want to create a student (1) or a teacher (2)? [Input the number]:"
      person_type = gets.chomp.to_i
      if person_type == 1
        puts "Age:"
        age = gets.chomp
        puts "Name:"
        name = gets.chomp
        puts "Has Parent Permission? [Y/N]:"
        parent_permission = gets.chomp.downcase == 'y'
      elsif person_type == 2
        puts "Age:"
        age = gets.chomp
        puts "Name:"
        name = gets.chomp
        puts "Specialization:"
        specialization = gets.chomp
      else
        puts "Invalid input."
      end
      app.create_person(name, age, person_type) 
      puts "Person created successfully" 
    when 4
      puts "Title:"
      title = gets.chomp
      puts "Author:"
      author = gets.chomp
      app.create_book(title, author)
      puts "Book created successfully"
    when 5
      puts "Select a book from the following list by number:"
    #   puts "Enter person id:"
    #   person_id = gets.chomp.to_i
    #   puts "Enter book id:"
    #   book_id = gets.chomp.to_i
    #   puts "Enter rented on date (YYYY-MM-DD):"
    #   rented_on = Date.parse(gets.chomp)
    #   puts "Enter due on date (YYYY-MM-DD):"
    #   due_on = Date.parse(gets.chomp)
    #   library.create_rental(person_id, book_id, rented_on, due_on)
    when 6
      puts "ID of person:"
      id = gets.chomp.to_i
    #   library.list_rentals_for_person(person_id)
    when 7
      puts "Thank you for using this app!"
      break
    else
      puts "Invalid option."
    end
  end
end

main
