class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :id_number
      t.string :university
      t.string :department
      t.references :user, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
