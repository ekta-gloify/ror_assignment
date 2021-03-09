class CreateLibraries < ActiveRecord::Migration[6.0]
  def change
    create_table :libraries do |t|
      t.string :l_name
      t.time :opening_time
      t.time :closing_time

      t.timestamps
    end
  end
end
