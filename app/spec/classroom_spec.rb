require_relative '../class_room'
require_relative '../student'

describe Classroom do
  before(:all) do
    @classroom = Classroom.new('Math')
    @student = Student.new(20, 'Johan', parent_permission: true)
    @classroom.add_student(@student)
  end
  it 'tests classroom label' do
    expect(@classroom.label).to eq('Math')
  end
  it 'test classroom class method' do
    @classroom.students.length == 1
  end
end
