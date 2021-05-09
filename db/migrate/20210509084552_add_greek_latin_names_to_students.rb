class AddGreekLatinNamesToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :greekFname, :string
    add_column :students, :greekLname, :string
    add_column :students, :latinFname, :string
    add_column :students, :latinLname, :string
  end
end
