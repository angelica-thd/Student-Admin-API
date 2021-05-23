class Message
  def self.not_found(record = 'record')
    "Sorry, #{record} not found."
  end

  def self.invalid_credentials
    'Invalid credentials'
  end

  def self.invalid_token
    'Invalid token'
  end

  def self.missing_token
    'Missing token'
  end

  def self.unauthorized
    'Unauthorized request'
  end

  def self.account_created
    'Account created successfully'
  end

  def self.student_created
    'Student created successfully'
  end

  def self.account_not_created
    'Account could not be created'
  end

  def self.basic
    'Basic user'
  end
  def self.student
    'Student user'
  end

  def self.logout
    'Logged out successfully.'
  end

  def self.basic_update
    'User updated successfully.'
  end
  def self.student_found
    'Student found.'
  end

  def self.student_not_found
    'Student was not found.'
  end

  def self.student_update
    'Student updated successfully.'
  end

  def self.basic_destroy
    'User deleted successfully.'
  end

  def self.student_destroy
    'Student deleted successfully.'
  end

  def self.expired_token
    'Sorry, your token has expired. Please login to continue.'
  end
  def self.user_exists
    'Sorry, a user with this email or username already exists. Please,use different ones.'
  end
  def self.student_exists
    'Sorry, a student with this student number already exists. Please,use a different one.'
  end
end
