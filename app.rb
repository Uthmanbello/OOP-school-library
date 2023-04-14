#!/usr/bin/env ruby
require './book'
require './rental'
require './person'
require './student'
require './teacher'

class App
  attr_accessor :books, :rentals, :people, :student, :teacher

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    @people.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_type = gets.chomp.to_i
    if person_type == 1
      puts 'Age:'
      age = gets.chomp
      puts 'Name:'
      name = gets.chomp
      puts 'Has Parent Permission? [Y/N]:'
      parent_permission = gets.chomp.downcase == 'y'
      person = Student.new(classroom = nil, age, name)
    elsif person_type == 2
      puts 'Age:'
      age = gets.chomp
      puts 'Name:'
      name = gets.chomp
      puts 'Specialization:'
      specialization = gets.chomp
      person = Teacher.new(age, name, specialization)
    else
      puts 'Invalid input.'
    end

    @people.push(person)
    person
    puts 'Person created successfully'
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    book
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number:'
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
      book = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id):'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      person = gets.chomp.to_i

    puts 'Date (YYYY-MM-DD):'
      date = Date.parse(gets.chomp)
      
    rental = Rental.new(date, @books[book], @people[person])
    @rentals.push(rental)
    rental
    puts 'Rental created successfully'
  end

  def list_rentals_for_person
    puts 'ID of person:'
    person_id = gets.chomp.to_i
    rentals = @rentals.select { |rental| rental.person.id == person_id }
    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end
