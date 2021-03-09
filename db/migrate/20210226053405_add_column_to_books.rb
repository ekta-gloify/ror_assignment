class AddColumnToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :author, foreign_key: true
    add_reference :books, :library, foreign_key: true
  end
end
