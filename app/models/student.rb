class Student < ApplicationRecord
  belongs_to :user,class_name: "User"
  validates_presence_of :name, :id_number, :university, :department
end
