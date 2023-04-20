require './person'

class Student < Person
  attr_accessor :parent_permission
  attr_reader :classroom

  def initialize(age, name, _parent_permission, classroom = nil)
    super(age, name)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    @classroom.students.push(self) unless @classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
