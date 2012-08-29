class Profile < ActiveRecord::Base
  attr_accessible :name,
                  :nickname,
                  :twitter,
                  :facebook,
                  :avatar_attributes

  has_one :avatar, as: :imageable,
                   class_name: 'Asset'

  accepts_nested_attributes_for :avatar

  belongs_to :user

  def complete?
    avatar && name
  end

  def twitter_url
    "http://www.twitter.com/#{twitter}"
  end

  def facebook_url
    "http://www.facebook.com/#{facebook}"
  end

end
