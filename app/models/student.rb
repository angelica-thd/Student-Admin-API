class Student < ApplicationRecord
  belongs_to :user,class_name: "User"
  validates_presence_of :greekFname,:greekLname,:latinFname,:latinLname,:address, :studentNumber, :institution,:school, :department, :photoURL, :srtoken
  before_create :assign_unique_case_number
  

  private
  def assign_unique_case_number
    self.srtoken = loop do
      number =SecureRandom.hex(10)
      break number unless Student.where(srtoken: number).exists?
    end
  end
    
end
