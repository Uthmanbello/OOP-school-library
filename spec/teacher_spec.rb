require 'rspec'
require './person'
require './teacher'

describe Teacher do
  before(:each) do
    @teacher = Teacher.new(30, 'Robert', 'History')
  end

  it 'has an age' do
    expect(@teacher.age).to eq(30)
  end

  it 'has a name' do
    expect(@teacher.name).to eq('Robert')
  end

  it 'has a specialization' do
    expect(@teacher.specialization).to eq('History')
  end

  it 'can use services' do
    expect(@teacher.can_use_services?).to be true
  end
end
