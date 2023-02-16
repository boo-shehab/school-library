require_relative '../book'
require_relative '../student'
require 'date'

describe Book do
  it 'has one book' do
    book = Book.new('title', 'author')
    book.should be_an_instance_of Book
  end
  it 'has rental book' do
    book = Book.new('title', 'author')
    person = Person.new(18, 'Ahmed', parent_permission: true)
    book.add_rental(person, Date.parse('2000/1/1'))
    book.rentals.length == 1
  end
end
