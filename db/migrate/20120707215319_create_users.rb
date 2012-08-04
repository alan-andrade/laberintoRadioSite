class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :twitter
      t.string :facebook
      t.timestamps
    end
  end
end
