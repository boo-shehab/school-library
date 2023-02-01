require_relative 'nameable'
class Person < Nameable
  attr_accessor :rentals, :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @rentals = []
    @id = rand(100_000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def can_use_services?
    (of_age? || @parent_permission)
  end

  def correct_name
    @name
  end

  def rentals_person(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
  end

  private

  def of_age?
    @age >= 18
  end
end
