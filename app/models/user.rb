class User < ActiveRecord::Base
  attr_accessible :email, :password, :profile_attributes

  acts_as_authentic do |c|
    c.require_password_confirmation = false
  end

  has_one :profile
  has_one :program

  accepts_nested_attributes_for :profile
end
