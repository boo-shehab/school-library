class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(date, person, book)
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
    @date = date
  end
end
