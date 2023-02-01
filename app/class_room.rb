class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @students = []
    @label = label
  end

  def add_student(student)
    @students.push(student)
    student.classroom = slef
  end
end
