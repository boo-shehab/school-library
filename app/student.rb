require_relative 'person'
class Student < Person
  def initialize(age, name, parent_permission, classroom)
    super(age, name, parent_permission)
    add_calssrom(classroom)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def add_classrom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
