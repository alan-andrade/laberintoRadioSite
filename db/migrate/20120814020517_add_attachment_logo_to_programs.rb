class AddAttachmentLogoToPrograms < ActiveRecord::Migration
  def self.up
    change_table :programs do |t|
      t.has_attached_file :logo
    end
  end

  def self.down
    drop_attached_file :programs, :logo
  end
end
