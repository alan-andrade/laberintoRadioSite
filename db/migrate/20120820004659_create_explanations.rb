class CreateExplanations < ActiveRecord::Migration
  def self.up
    create_table :explanations do |t|
      t.references :explainable, polymorphic: true
      t.text :body, default: ''
    end
    add_index :explanations, :explainable_id
  end

  def self.down
    drop_table :explanations
  end
end
