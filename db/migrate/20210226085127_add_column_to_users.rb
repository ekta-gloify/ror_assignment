class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :a_name, :string
    add_column :users, :date_of_birth, :date
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
