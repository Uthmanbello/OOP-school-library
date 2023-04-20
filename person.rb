require './nameable'
require './capitalize'
require './trim'

class Person < Nameable
  attr_accessor :name, :age, :id, :parent_permission
  attr_reader :rentals

  def initialize(age, name = 'Unknown', _parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @rentals = []
    super()
  end

  def can_use_services?
    of_age? || parent_permission ? true : false
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
