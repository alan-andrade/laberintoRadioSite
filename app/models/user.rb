class User < ActiveRecord::Base
  attr_accessible :email, :password, :profile_attributes, :admin

  scope :minus, ->(u){ where(["users.id != ?", u.id])}
  scope :without_program, where("users.program_id IS NULL")

  acts_as_authentic do |c|
    c.require_password_confirmation = false
  end

  has_one :profile

  accepts_nested_attributes_for :profile

  delegate :name, to: :profile

  has_many :schedules,  dependent: :destroy
  has_many :programs,   through: :schedules

end
