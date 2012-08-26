class Program < ActiveRecord::Base
  attr_accessible :description,
                  :name,
                  :user_ids,
                  :logo_attributes,
                  :space_attributes

  validate :name, :space, presence: true

  has_many :schedules,  dependent: :destroy
  has_many :users,      through: :schedules
  has_one  :logo,       as: :imageable,
                        class_name: 'Asset'
  has_one :space,       validate: true,
                        inverse_of: :program

  validate if: ->{ users.empty? } do
    errors.add(:users, 'Necesitas un locutor')
  end

  accepts_nested_attributes_for :logo
  accepts_nested_attributes_for :space

end
