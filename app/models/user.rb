class User < ActiveRecord::Base
  attr_accessible :email,
                  :password,
                  :profile_attributes,
                  :admin # mmm, this should not be mass assignable

  acts_as_authentic { |c| c.require_password_confirmation = false }

  has_one :profile

  accepts_nested_attributes_for :profile

  delegate :name, to: :profile

  has_many :schedules,  dependent: :destroy
  has_many :programs,   through: :schedules

end
