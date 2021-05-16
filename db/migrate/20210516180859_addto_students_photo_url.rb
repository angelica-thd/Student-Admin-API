class AddtoStudentsPhotoUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :photoURL, :string
    
  end
end
