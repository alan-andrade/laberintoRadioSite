class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name, null: false
      t.text :description
    end
  end

  def down
    remove_table :programs
  end
end
