require './student'
require'./classroom'
require './person'

mike = Student.new("Math", 12, "Mike")
alice = Student.new("Math", 14, "Alice")

class1 = Classroom.new("Math")
puts class1.add_student(mike)
puts class1.add_student(alice)