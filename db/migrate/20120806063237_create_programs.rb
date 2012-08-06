class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.references :user, null: false
      t.string :name, default: 'Programa sin nombre'
      t.text :description
    end
    add_index :programs, :user_id
  end

  def down
    remove_table :programs
  end
end
