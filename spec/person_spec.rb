require './person'
require './book'
require './rental'

RSpec.describe Person do
  describe '#add_rental' do
    let(:book) { instance_double('Book', title: 'The Guardians of the Galaxy', author: 'Diego Uthman', rentals: []) }
    let(:person) { Person.new(25, 'John') }

    describe '#initialize' do
      it 'should create a new person with the correct attributes' do
        expect(person.name).to eq 'John'
        expect(person.age).to eq 25
        expect(person.id).not_to be_nil
      end
    end

    describe '#can_use_services?' do
      context 'when the person is of age' do
        it 'should return true' do
          expect(person.can_use_services?).to be true
        end
      end

      context 'when the person is not of age' do
        let(:person) { Person.new(17, 'John') }

        it 'should return false' do
          expect(person.can_use_services?).to be false
        end
      end
    end

    describe '#correct_name' do
      it 'should return the person\'s name' do
        expect(person.correct_name).to eq 'John'
      end
    end

    it 'creates a new rental with date, book and person' do
      rental = person.add_rental('2023-04-20', book)
      expect(rental).to be_a(Rental)
      expect(rental.date).to eq('2023-04-20')
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end
  end
end
