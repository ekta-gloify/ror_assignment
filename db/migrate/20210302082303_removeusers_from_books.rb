class RemoveusersFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :users
  end
end
