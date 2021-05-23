class Student < ApplicationRecord
  belongs_to :user,class_name: "User"
  validates_presence_of :greekFname,:greekLname,:latinFname,:latinLname,:address, :studentNumber, :institution,:school, :department, :photoURL, :srtoken
  after_initialize :init
  
  def init
    loop do
      @token = SecureRandom.hex(10)

      break @token unless Student.where(srtoken: @token).exists?
    end
    self.srtoken = @token
  end
end
