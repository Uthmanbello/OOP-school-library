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

  def create_person(name, age, type, specialization = nil)
    if type == 1
      person = Student.new(classroom = nil, age, name)
    elsif type == 2
      person = Teacher.new(age, name, specialization)
    else
      raise "Invalid person type"
    end 
    @people.push(person)
    person
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
    book
  end

#   def create_rental
#   end

#   def list_rentals_for_person
#   end
end