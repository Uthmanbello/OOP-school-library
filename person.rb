require "./nameable.rb"

class Person < Nameable
  def initialize(age, name = 'Unknown', _parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    of_age? || parent_permission ? true : false
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalizedPerson = CapitalizeDecorator.new(person)
puts capitalizedPerson.correct_name
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
puts capitalizedTrimmedPerson.correct_name