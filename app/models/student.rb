class Student < ApplicationRecord
  belongs_to :user,class_name: "User"
  validates_presence_of :greekFname,:greekLname,:latinFname,:latinLname,:address, :studentNumber, :institution,:school, :department, :photo, :srtoken


  before_validation(:on => :create) do
    self.srtoken = assign_unique_case_number unless attribute_present?("srtoken")
  end


  private
  def assign_unique_case_number(column = 'srtoken')
    self.srtoken = loop do
      secure_token = JsonWebToken.student_token(payload: {studentNumber: self.studentNumber, user_id: user.id}) 
      break secure_token unless Student.where(srtoken: secure_token).exists?
     end  
  end



    
end
