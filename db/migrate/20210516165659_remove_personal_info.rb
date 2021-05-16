class RemovePersonalInfo < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :zipCode
    remove_column :students, :academicZipCode
    remove_column :students, :prefecture
    remove_column :students, :studentAMKA
    remove_column :students, :academicPrefecture
  end
end
