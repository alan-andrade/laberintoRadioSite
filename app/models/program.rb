class Program < ActiveRecord::Base
  attr_accessible :description, :name, :user_ids

  validate :name, presence: true

  has_many :schedules,  dependent: :destroy
  has_many :users,      through: :schedules

  validate :need_one_broadcaster

  private

  def need_one_broadcaster
    errors.add(:users, 'Necesitas un locutor') if users.empty?
  end

end
