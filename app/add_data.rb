class AddData
    def add_book(book)
        File.open('books.json') do |book_add|
            new_book = { title: book.title, author: book.author}
            if book_add.size.zero?
                book_list = [new_book]
            else
                book_list = JSON.parse(File.read('books.json'))
                book_list << new_book unless book_list.include? new_book
            end
            File.open('books.json', 'w') do |file|
                file.write(JSON.generate(book_list))
            end
        end
    end
    def add_person(person)
        File.open('people.json') do |person_add|
            puts person_add.size.zero?
            if "#{person.class}" == "Student"
                obj = {
                    class: person.class,
                    age: person.age,
                    name: person.name,
                    parent_permission: person.parent_permission,
                    id: person.id
                }
            else
                obj = {
                    class: person.class,
                    specialization: person.specialization,
                    age: person.age,
                    name: person.name,
                    parent_permission: person.parent_permission,
                    id: person.id
                }
            end
            if person_add.size.zero?
                list = [obj]
            else
                list = JSON.parse(File.read('people.json'))
                list << obj unless list.include? obj
            end
            File.open('people.json', 'w') do |file|
                file.write(JSON.generate(list))
            end
        end
    end
    def add_rentals(date, book_title, person_name)
        File.open('rentals.json') do |rental_add|
            rental = {
                date: date,
                book_title: book_title,
                person: person_name
            }
            if rental_add.size.zero?
                rentals = [rental]
            else
                rentals = JSON.parse(File.read('rentals.json'))
                rentals << rental unless rentals.include? rental
            end
            File.open('rentals.json', 'w') do |file|
                file.write(JSON.generate(rentals))
            end
        end
    end
end