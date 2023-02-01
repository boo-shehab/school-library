class Classroom
  attr_accessor :lable

  @students = []
  def initialize(label)
    @label = label
  end

  def add_student(student)
    @students.push(student)
    student.classroom = slef
  end
end
