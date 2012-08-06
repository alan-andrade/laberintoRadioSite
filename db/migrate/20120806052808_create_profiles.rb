class CreateProfiles < ActiveRecord::Migration
  def up
    create_table :profiles do |t|
      t.references :user
    end

    add_index :profiles, :user_id, name: 'users_profile_index'
  end

  def down
    drop_table :profiles
  end
end
