require_relative 'person'
require_relative 'book'
require_relative 'rental'

@book1 = Book.new('night', 'Ahmed')
@book2 = Book.new('morning', 'me')

@person1 = Person.new(20, 'Tim')
@person2 = Person.new(22, 'jack')

@rental1 = Rental.new('2022-9-12', @person1, @book1)
@rental2 = Rental.new('2022-10-22', @person1, @book2)
@rental3 = Rental.new('2023-1-22', @person2, @book1)
puts @book1.rentals.count
puts @book2.rentals.count
puts @person1.rentals.count
puts @person2.rentals.count
