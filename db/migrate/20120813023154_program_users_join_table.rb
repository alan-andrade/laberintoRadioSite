class ProgramUsersJoinTable < ActiveRecord::Migration
  def up
    create_table :schedules, force: true do |t|
      t.references :user, null: false
      t.references :program, null: false
    end

    add_index :schedules, :user_id
    add_index :schedules, :program_id
  end

  def down
    remove_index :schedules, :user_id
    remove_index :schedules, :program_id
    drop_table :schedules
  end
end
