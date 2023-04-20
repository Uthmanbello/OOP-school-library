class Lister
  def initialize(objects)
    @objects = objects
  end

  def list_books
    books = @objects.select { |object| object.is_a?(Book) }
    books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    people = @objects.select { |object| object.is_a?(Person) }
    people.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_rentals
    rentals = @objects.select { |object| object.is_a?(Rental) }
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end
