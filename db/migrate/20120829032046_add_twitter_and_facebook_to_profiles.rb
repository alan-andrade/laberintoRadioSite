class AddTwitterAndFacebookToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :twitter, :string
    add_column :profiles, :facebook, :string
  end
end
