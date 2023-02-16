require_relative '../person'
require_relative '../book'
require 'date'

describe Person do
  before(:all) do
    @person = Person.new(15, 'test', parent_permission: false)
  end
  it 'test add_rental method' do
    @person.add_rental(Book.new('test_title2', 'test_author2'), Date.parse('2000/1/1'))
    @person.rentals.length == 1
  end
  it 'test correct_name method' do
    @person.correct_name == @person.name
  end
  it 'test can_use_services method' do
    @person.can_use_services? == false
  end
end
