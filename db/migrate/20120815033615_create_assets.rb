class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.references :imageable, polymorphic: true
      t.has_attached_file :image
    end
  end

  def self.down
    drop_table :assets
  end

end
