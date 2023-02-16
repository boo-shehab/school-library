require_relative '../student'
require_relative '../class_room'
require_relative '../person'

describe Student do
  before(:all) do
    @student = Student.new(17, 'peter', parent_permission: false)
  end
  it 'is inherent form person' do
    Student == Person
  end

  it 'test play_hooky method' do
    @student.play_hooky == '¯\(ツ)/¯'
  end
  it 'tets classroom method' do
    @student.classroom == be_nil
  end
end
