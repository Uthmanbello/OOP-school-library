require 'date'
require './app'

def display_menu
  puts "\nWelcome to School Library App!"
  puts "\nPlease choose an option by entering a number:"
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def process_option(option, app)
  menu = {
    1 => :list_books,
    2 => :list_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals_for_person,
    7 => :exit
  }

  if menu.key?(option)
    app.send(menu[option])
    return true if menu[option] == :exit
  else
    puts 'Invalid option.'
  end

  false
end

def main
  app = App.new

  loop do
    display_menu
    option = gets.chomp.to_i
    break if process_option(option, app)
  end
end

main
