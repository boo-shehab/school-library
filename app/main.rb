require_relative 'app'
require_relative 'book'
require_relative 'class_room'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'

@lib = App.new

def main
  loop do
    puts main_section
    choice = get_number('', 'Please enter a valid number!')
    return if choice == 7

    run_available_options(choice)
  end
end

def main_section
  'Please choose an option by entering a number:
1 - List all books
2 - List all people
3 - Create a person
4 - Create a book
5 - Create a rental
6 - List all rentals for a given person
7 - Exit'
end

def run_available_options(choice)
  case choice
  when 1
    @lib.list_books
  when 2
    @lib.list_people
  when 3
    @lib.add_person
  when 4
    @lib.add_book
  when 5
    @lib.add_rental
  when 6
    @lib.list_rentalsg
  end
end
main
