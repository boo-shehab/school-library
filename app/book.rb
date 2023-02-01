class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @rentals = []
    @title = title
    @author = author
  end
end
