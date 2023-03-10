require_relative 'person'
require_relative 'book'
require_relative 'class_room'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'
require_relative 'get_data'
require_relative 'add_data'
require 'date'

require 'json'

class App
  def initialize
    @books = GetData.new.list_of_books
    @people = GetData.new.list_of_people

    GetData.new.get_rentals(@books, @people)

    puts "Welcome to School Library App!\n\n"
  end

  def add_person
    person_type = get_number('Do you want to create a Student (1) or a teacher (2)?. Back to main (any number): ',
                             'Please enter a valid number!')
    case person_type
    when 1
      add_student
    when 2
      add_teacher
    else
      puts ''
    end
  end

  def add_student
    age = get_number('Age: ', 'Please enter a valid number!')
    name = get_str('Name: ', 'Please enter a proper name!')
    permission = get_bool('Parent permission (y/n): ', 'Please enter either (y/n)!')
    student = Student.new(age, name, parent_permission: permission)
    return unless student

    AddData.new.add_person(student)
    @people << student
    puts "Student #{name} is added!\n\n"
  end

  def add_teacher
    specialization = get_str('Specialization: ', 'Please enter a proper specialization!')
    age = get_number('Age: ', 'Please enter a valid number!')
    name = get_str('Name: ', 'Please enter a proper name!')
    teacher = Teacher.new(specialization, age, name)
    return unless teacher

    AddData.new.add_person(teacher)
    @people << teacher
    puts "Teacher #{name} is added!\n\n"
  end

  def add_book
    title = get_str('Title: ', 'Please enter a valid title!')
    author = get_str('Author: ', 'Please enter a valid author!')
    book = Book.new(title, author)
    return unless book

    AddData.new.add_book(book)
    @books << book
    puts "Book #{title} is created successfully!\n\n"
  end

  def list_books(with_id: false)
    if with_id
      @books.each_with_index { |book, idx| puts "#{idx}) Title: #{book.title}, Author: #{book.author}" }
    else
      if @books.empty?
        puts "No books added yet\n\n"
        return
      end
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
    puts ''
  end

  def list_people(with_id: false)
    if with_id
      @people.each_with_index do |person, idx|
        puts "#{idx}) [#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      end
    else
      if @people.empty?
        puts "No person created yet\n\n"
        return
      end
      @people.each { |person| puts "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
    end
    puts ''
  end

  def add_rental()
    if @people.empty? || @books.empty?
      puts "Either People or book List is empty. Please populate these lists in order to check rentals\n\n"
      return
    end

    puts 'Select a book from the following list:'
    list_books(with_id: true)
    book_idx = get_number('Book: ', 'Please enter a valid number!')

    puts 'Select a person from the following list:'
    list_people(with_id: true)
    person_idx = get_number('Borrower: ', 'Please enter a valid number!')
    date = get_date('Date: ', 'Please enter a valid date!')

    begin
      Rental.new(date, @books.at(book_idx), @people.at(person_idx))
    rescue NoMethodError
      puts "Book or person not found. Please try again!\n\n"
      return add_rental
    end
    AddData.new.add_rentals(date, @books.at(book_idx).title, @people.at(person_idx).name)
    puts "Rental Added!\n\n"
  end

  def list_rentals
    if @people.empty?
      puts "People List is empty. Please add people in order to check their rentals\n\n"
      return
    end
    puts 'Select a person ID from the following list:'
    list_people

    person_id = get_number('Person ID: ', 'Please enter a valid number!')
    person = @people.find { |current_person| current_person.id == person_id }
    if person.nil?
      puts "Person with ID: #{person_id} not found!\n\n"
      return list_rentals(people)
    end

    if person.rentals.empty?
      puts "#{person.name} didn't rent any book yet\n\n"
    else
      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title} By #{rental.book.author}\n\n"
      end
    end
  end
end

class Boolean
  attr_reader :value

  def initialize(str)
    case str
    when 'y', 'yes', 'Yes', 'Y', 'YES'
      @value = true
    when 'n', 'no', 'No', 'N', 'NO'
      @value = false
    end
  end
end

def get_str(param_name, error = '')
  print param_name
  input = gets.chomp

  if input.length > 50 || input.length < 3
    puts error
    return get_str(param_name, error)
  end
  input
end

def get_number(param_name, error = '')
  print param_name
  input = gets.chomp
  converted = input.to_i

  unless converted.positive? || input == '0'
    puts error
    return get_number(param_name, error)
  end
  converted
end

def get_bool(param_name, error = '')
  print param_name
  input = gets.chomp
  input = Boolean.new(input).value

  unless [true, false].include?(input)
    puts error
    return get_bool(param_name, error)
  end
  input
end

def get_date(param_name, error = '')
  print param_name
  input = gets.chomp

  begin
    Date.parse(input)
  rescue Date::Error
    puts error
    get_date(param_name, error)
  end
end
