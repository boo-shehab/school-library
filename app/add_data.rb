class AddData
  def add_book(book)
    File.open('books.json') do |book_add|
      new_book = { title: book.title, author: book.author }
      if book_add == ''
        data = [new_book]
      else
        data = JSON.parse(File.read('books.json'))
        data << new_book unless data.include? new_book
      end
      File.write('books.json', JSON.generate(data))
    end
  end

  def add_person(person)
    File.open('people.json') do |person_add|
      obj = person_type(person)
      if person_add == ''
        list = [obj]
      else
        list = JSON.parse(File.read('people.json'))
        list << obj unless list.include? obj
      end
      File.write('people.json', JSON.generate(list))
    end
  end

  def person_type(person)
    if person.class.to_s == 'Student'
      {
        class: person.class,
        age: person.age,
        name: person.name,
        parent_permission: person.parent_permission,
        id: person.id
      }
    else
      {
        class: person.class,
        specialization: person.specialization,
        age: person.age,
        name: person.name,
        parent_permission: person.parent_permission,
        id: person.id
      }
    end
  end

  def add_rentals(date, book_title, person_name)
    File.open('rentals.json') do |rental_add|
      rental = {
        date: date,
        book_title: book_title,
        person: person_name
      }

      if rental_add == ''
        data = [rental]
      else
        data = JSON.parse(File.read('rentals.json'))
        data << rental unless data.include? rental
      end
      File.write('rentals.json', JSON.generate(data))
    end
  end
end
