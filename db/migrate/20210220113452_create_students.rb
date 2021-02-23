class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.text :name
      t.text :id_number
      t.text :university
      t.text :department
      t.references :user, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
