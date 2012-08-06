class Profile < ActiveRecord::Base
  attr_accessible :name, :nickname

  belongs_to :user
end
