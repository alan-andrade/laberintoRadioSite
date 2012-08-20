class User < ActiveRecord::Base
  attr_accessible :email,
                  :password,
                  :profile_attributes,
                  :bio_attributes,
                  :admin # mmm, this should not be mass assignable

  acts_as_authentic { |c| c.require_password_confirmation = false }

  has_one :profile
  has_one :bio, as: :explainable,
                class_name: 'Explanation'

  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :bio

  delegate :name, to: :profile

  has_many :schedules,  dependent: :destroy
  has_many :programs,   through: :schedules

end
