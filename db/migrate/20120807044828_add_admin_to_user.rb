class AddAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
  end

  def down
    remove_column :users, :admin
  end
end
