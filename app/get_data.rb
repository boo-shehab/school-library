require 'json'

class GetData
  def list_of_books
    books = []
    return books unless File.read('books.json') != ''

    JSON.parse(File.read('books.json')).map do |book|
      title = book['title']
      author = book['author']
      books.push(Book.new(title, author))
    end
    books
  end

  def list_of_people
    people = []
    return people unless File.read('people.json') != ''

    people_file = File.open('people.json')

    data = JSON.parse(people_file.read)
    data.each do |person|
      case person['class']
      when 'Student'
        people << Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
      when 'Teacher'
        people << Teacher.new(person['specialization'], person['age'], person['name'])
      else
        puts ''
      end
    end
    people_file.close
    people
  end

  def get_rentals(books, people)
    return unless File.read('rentals.json') != ''

    rentals_file = File.open('rentals.json')

    data = JSON.parse(rentals_file.read)
    data.each do |rental|
      book = books.at(books.index(books.find { |b| b.title == rental['book_title'] }))
      person = people.at(people.index(people.find { |p| p.name == rental['person'] }))
      Rental.new(rental['date'], book, person)
    end
  end
end
