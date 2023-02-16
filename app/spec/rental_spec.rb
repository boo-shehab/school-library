require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
  it 'has reantal' do
    person = Person.new(17, 'test')
    book = Book.new('title', 'author')
    rental = Rental.new('2000/1/1', book, person)
    rental.date == '2000/1/1'
  end
end
