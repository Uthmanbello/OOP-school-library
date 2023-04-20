require './book'
require './rental'
require './person'
require './student'
require './teacher'
require './menu'
require './lister'
require 'json'

class App
  attr_accessor :books, :rentals, :people, :student, :teacher

  def initialize
    r = Rentals.new
    @books = add_books || []
    @people = add_people || []
    @rentals = r.add_rentals || []
  end

  def preseve_book
    puts 'Preserve the books'
    books_ojects = []
    @books.each { |book| books_ojects << { title: book.title, author: book.author } }
    File.write('books.json', books_ojects.to_json)
  end

  def add_books
    books = []
    if File.exist?('books.json') && !File.empty?('books.json')
      data = JSON.parse(File.read('books.json'))
      data.each { |book| books << Book.new(book['title'], book['author']) }
    end
    books
  end

  def preserve_person
    people_ojects = []
    @people.each do |people|
      people_ojects << if people.instance_of?(::Student)
                         { age: people.age, classroom: people.classroom, name: people.name, id: people.id,
                           parent_permission: people.parent_permission, type: people.class.name }
                       else
                         { age: people.age, id: people.id, specialization: people.specialization, name: people.name,
                           type: people.class.name }
                       end
    end
    File.write('people.json', people_ojects.to_json)
  end

  def add_people
    people = []
    if File.exist?('people.json') && !File.empty?('people.json')
      data = JSON.parse(File.read('people.json'))
      data.each do |person|
        if person['type'] == 'Student'
          student = Student.new(person['age'], person['name'], person['classroom'])
          student.id = person['id']
          people << student
        else
          teacher = Teacher.new(person['age'], person['name'], person['specialization'])
          teacher.id = person['id']
          people << teacher
        end
      end
    end
    people
  end

  def preserve_rental
    rental_objects = @rentals.map do |rental|
      book_obj = { title: rental.book.title, author: rental.book.author }
      person_data = { age: rental.person.age, name: rental.person.name, id: rental.person.id }
      if rental.person.is_a?(Student)
        person_data[:classroom] = rental.person.classroom
      else
        person_data[:specialization] = rental.person.specialization
      end
      { date: rental.date, book: book_obj, person: person_data }
    end
    File.write('rentals.json', rental_objects.to_json)
  end

  def list_books
    Lister.new(@books).list_books
  end

  def list_people
    Lister.new(@people).list_people
  end

  def create_person
    person_type = person_type_input
    if person_type == 1
      person = create_student
    elsif person_type == 2
      person = create_teacher
    else
      puts 'Invalid input.'
      return
    end
    push_person_to_list(person)
    preserve_person
    puts 'Person created successfully'
  end

  def person_type_input
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    gets.chomp.to_i
  end

  def create_student
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Has Parent Permission? [Y/N]:'
    parent_permission = gets.chomp.downcase == 'y'
    Student.new(age, name, parent_permission)
  end

  def create_teacher
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    Teacher.new(age, name, specialization)
  end

  def push_person_to_list(person)
    @people.push(person)
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    preseve_book
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
    preserve_rental
    puts 'Rental created successfully'
  end

  def list_rentals_for_person
    puts 'ID of person:'
    person_id = gets.chomp.to_i
    rentals = @rentals.select { |rental| rental.person.id == person_id }
    puts 'Rentals:'
    Lister.new(rentals).list_rentals
  end

  private :push_person_to_list, :create_teacher, :create_student, :person_type_input
end

class Rentals
  def add_rentals
    rentals = []
    if File.exist?('rentals.json') && !File.empty?('rentals.json')
      data = JSON.parse(File.read('rentals.json'))
      data.each do |rental_data|
        book_data = rental_data['book']
        person_data = rental_data['person']
        book = Book.new(book_data['title'], book_data['author'])
        person = if person_data['type'] == 'Student'
                   Student.new(person_data['age'], person_data['classrom'], person_data['name'])
                 else
                   Teacher.new(person_data['age'], person_data['specialization'], person_data['name'])
                 end
        person.id = person_data['id']
        rentals << Rental.new(rental_data['date'], book, person)
      end
    end
    rentals
  end
end
