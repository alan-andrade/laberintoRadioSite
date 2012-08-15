class Program < ActiveRecord::Base
  attr_accessible :description, :name, :user_ids, :logo_attributes

  validate :name, presence: true

  has_many :schedules,  dependent: :destroy
  has_many :users,      through: :schedules
  has_one  :logo,       as: :imageable,
                        class_name: 'Asset'

  validate :need_one_broadcaster

  accepts_nested_attributes_for :logo

  private

  def need_one_broadcaster
    errors.add(:users, 'Necesitas un locutor') if users.empty?
  end

end
