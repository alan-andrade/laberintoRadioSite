class Program < ActiveRecord::Base
  attr_accessible :description, :name

  belongs_to :user

  validate :name, presence: true
end
