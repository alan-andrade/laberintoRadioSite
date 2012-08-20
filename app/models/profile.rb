class Profile < ActiveRecord::Base
  attr_accessible :name,
                  :nickname,
                  :avatar_attributes

  has_one :avatar, as: :imageable,
                   class_name: 'Asset'

  accepts_nested_attributes_for :avatar

  belongs_to :user
end
