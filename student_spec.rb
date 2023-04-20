require 'rspec'
require './student'
require './classroom'
require './book'
require 'date'

describe Student do
  let(:classroom) { Classroom.new('Class 101') }
  let(:student) { Student.new(16, 'John Doe', true) }

  it 'has a name' do
    expect(student.name).to eq('John Doe')
  end

  it 'has an age' do
    expect(student.age).to eq(16)
  end

  it 'can have a classroom' do
    student.classroom = classroom
    expect(student.classroom).to eq(classroom)
    expect(classroom.students).to include(student)
  end

  it 'can play hooky' do
    expect(student.play_hooky).to eq('¯(ツ)/¯')
  end

  it 'can use services if of age' do
    student.age = 18
    expect(student.can_use_services?).to be true
  end

  it 'has an ID' do
    expect(student.id).to be_between(1, 1000)
  end
end
