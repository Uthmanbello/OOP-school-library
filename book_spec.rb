require './book'

describe Book do
  let(:book) { Book.new("The Uthman", "Diego S.") }
  
  describe "#initialize" do
    it "creates a new book instance with the given title and author" do
      expect(book.title).to eq("The Uthman")
      expect(book.author).to eq("Diego S.")
      expect(book.rentals).to eq([])
    end
  end
end