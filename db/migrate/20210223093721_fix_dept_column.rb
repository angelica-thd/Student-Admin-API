class FixDeptColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :departement, :string
    add_column :students, :dept, :string
  end
end
