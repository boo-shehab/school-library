require 'json'

class GetData

    def get_books
        books = []
        return books unless File.exist?('books.json')
        File.open('books.json') do |books_file|
            return books unless !books_file.size.zero?
            data = JSON.parse(books_file.read)
            data.each { |book| books << Book.new(book['title'], book['author'])}
        end
        books
    end
    def get_people
        people = []
        return people unless File.exist?('people.json')
        File.open('people.json') do |people_file|
            return people unless !people_file.size.zero?
            data = JSON.parse(people_file.read)
            data.each { |person| 
                if person['class'] == 'Student'
                    people << Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
                else
                    people << Teacher.new(person['specialization'], person['age'], person['name'])
                end
            }
        end
        people
    end
    def get_rentals(books, people)
        return unless File.exist?('rentals.json')
        File.open('rentals.json') do |rentals_file|
            return unless !rentals_file.size.zero?
            data = JSON.parse(rentals_file.read)
            data.each { |rental|
                book = books.at(books.index(books.find { |b| b.title == rental['book_title'] }))
                person = people.at(people.index(people.find { |p| p.name == rental['person'] }))
                Rental.new(rental['date'], book, person)
            }

        end
    end
end