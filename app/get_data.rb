require 'json'

class GetData
  def list_of_books
    books = []
    return books unless File.exist?('books.json')

    books_file = File.open('books.json')
    return books unless !books_file.size.zero?

    data = JSON.parse(books_file.read)

    data.each { |book| books << Book.new(book['title'], book['author']) }
    books
  end

  def list_of_people
    people = []
    return people unless File.exist?('people.json')

    people_file = File.open('people.json')
    return people unless !people_file.size.zero?

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
    return unless File.exist?('rentals.json')

    File.open('rentals.json') do |rentals_file|
      break unless !rentals_file.size.zero?

      data = JSON.parse(rentals_file.read)
      data.each do |rental|
        book = books.at(books.index(books.find { |b| b.title == rental['book_title'] }))
        person = people.at(people.index(people.find { |p| p.name == rental['person'] }))
        Rental.new(rental['date'], book, person)
      end
    end
  end
end
