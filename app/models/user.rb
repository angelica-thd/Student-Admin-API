class User < ApplicationRecord
  # encrypt password
  has_secure_password
  
  pass_requirements = /\A
  (?=.{8,})
  (?=.*\d)
  (?=.*[a-z])
  (?=.*[A-Z])
  /x

  # Model associations
  has_many :students,foreign_key: :user_id
  # Validations
  validates_presence_of :name, :username, :password_digest
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :password, format: pass_requirements


end
