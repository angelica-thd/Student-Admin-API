class RenameCols < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :greekFname
    remove_column :students, :studentNumber
    rename_column :students, :name, :greekFname
    rename_column :students, :university, :institution
    rename_column :students, :id_number, :studentNumber
   
  end
end
