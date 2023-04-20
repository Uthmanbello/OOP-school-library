require 'rspec'
require_relative './rental'
require_relative './book'
require_relative './person'

describe Rental do
  let(:date) { '2023-01-01' }
  let(:book) { Book.new('Lord of the rings', 'Tolkien') }
  let(:person) { Person.new(67, 'Phil') }
  let(:rental) { Rental.new(date, book, person) }

  describe '#initialize' do
    it 'should set the date, book, and person attributes' do
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'should add the rental to the book and person rentals list' do
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end
end
