class AddSecureRandomToken < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :srtoken, :string
  end
end
