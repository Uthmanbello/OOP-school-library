require './book'
require './rental'

describe Book do
  let(:book) { Book.new('The Uthman', 'Diego S.') }
  let(:person) { instance_double('Person', name: 'John', age: 25, rentals: []) }

  describe '#initialize' do
    it 'creates a new book with title and author attributes' do
      expect(book.title).to eq('The Uthman')
      expect(book.author).to eq('Diego S.')
    end

    it 'creates a rentals array that is empty' do
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'creates a new rental with a date, book, and person' do
      rental = book.add_rental('2023-04-20', person)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(rental.date).to eq('2023-04-20')
    end
  end
end
