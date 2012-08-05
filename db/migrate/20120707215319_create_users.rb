class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string    :email,               null: false
      t.string    :crypted_password,    null: false
      t.string    :password_salt,       null: false
      t.string    :persistence_token,   null: false
      t.string    :single_access_token, null: false
      t.string    :perishable_token,    null: false
    end
  end

  def down
    drop_table :users
  end
end
