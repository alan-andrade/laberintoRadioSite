class User < ActiveRecord::Base
  attr_accessible :email, :password

  acts_as_authentic do |c|
    c.require_password_confirmation = false
  end

  has_one :profile

end
