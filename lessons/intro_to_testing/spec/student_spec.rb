# Add the 2 requires you will need here
require 'rspec'
require './lib/student' # no need for .rb bc it will autom. look for rb file

# We are using the RSpec DSL(Domain Specific Language)

# Every Rspec needs a RSpec.describe block
# runs on the Student class
RSpec.describe Student do
 
  # conventional to have a describe block for each method (for human empathy/readability)
  # ruby convention to use # to indicate instance method (::class_method)
  describe '#initialize' do
    
    # test it exists
    # test description in ''
    it 'has an instance of student' do
      student = Student.new('Penelope')

      expect(student).to be_an_instance_of(Student)
    end
    
    # run tests as you build them 
    # and code only what you need to pass the test
    # so that you only write code that you need

    #by instructor preference, one it block for attributes
    it 'has attributes' do
      student = Student.new('Penelope')
      student_2 = Student.new('Logan')
      
      expect(student.name).to eq('Penelope')
      # second name test to make sure it is dynamic
      # that name = penelope is not a false positive
      expect(student_2.name).to eq('Logan')
      expect(student.cookies).to eq([])
    end

    # separate tests
    # # test it has a name
    # it 'has a name' do
    #   student = Student.new('Penelope')
    
    #   expect(student.name).to eq('Penelope')
    # end

    # # test it has cookies
    # it 'has cookies' do
    #   student = Student.new('Penelope')

    #   expect(student.cookies).to eq([])
    # end
  end

  describe '#add_cookies' do
    # test it can add cookies
    it 'add a cookie to a student cookies array' do
      student = Student.new('Penelope')
      
      student.add_cookie('Chocolate Chunk')
      student.add_cookie('Snickerdoodle')

      expect(student.cookies).to eq(['Chocolate Chunk', 'Snickerdoodle'])
    end
  end
end
