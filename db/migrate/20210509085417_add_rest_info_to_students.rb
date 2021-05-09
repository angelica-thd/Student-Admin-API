class AddRestInfoToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :address, :string
    add_column :students, :zipCode, :string
    add_column :students, :city, :string
    add_column :students, :prefecture, :string
    add_column :students, :school, :string
    add_column :students, :academicAddress, :string
    add_column :students, :academicZipCode, :string
    add_column :students, :academicPrefecture, :string
    add_column :students, :academicCity, :string
    add_column :students, :studentshipType, :string
    add_column :students, :studentNumber, :string
    add_column :students, :studentAMKA, :string
    add_column :students, :entryDate, :string
  end
end
