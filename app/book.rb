class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @rentals = []
    @title = title
    @author = author
  end

  def rentals_book(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
  end
end
