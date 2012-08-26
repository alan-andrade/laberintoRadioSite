class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.integer :day
      t.integer :hour
      t.integer :minute
      t.references :program
    end
    add_index :spaces, :program_id
  end
end
