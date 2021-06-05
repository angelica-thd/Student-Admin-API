class RenamePhotUrl < ActiveRecord::Migration[5.1]
  def change
    rename_column :students, :photoURL, :photo
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
