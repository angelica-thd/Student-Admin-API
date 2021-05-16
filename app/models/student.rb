class Student < ApplicationRecord
  belongs_to :user,class_name: "User"
  validates_presence_of :greekFname,:greekLname,:latinFname,:latinLname,:address, :studentNumber, :institution,:school, :department, :photoURL
end
