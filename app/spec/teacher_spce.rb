require_relative '../teacher'
require_relative '../person'

describe Teacher do
  before(:each) do
    @teacher = Teacher.new('Math', 33, 'jack')
  end
  it 'is inherent form person' do
    @teacher == Person
  end

  it 'test can_use_services? method' do
    @teacher.can_use_services? == true
  end
end
