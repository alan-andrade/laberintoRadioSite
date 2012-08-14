class Program < ActiveRecord::Base
  attr_accessible :description, :name, :user_ids, :logo

  validate :name, presence: true

  has_many :schedules,  dependent: :destroy
  has_many :users,      through: :schedules

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }

  validate :need_one_broadcaster

  private

  def need_one_broadcaster
    errors.add(:users, 'Necesitas un locutor') if users.empty?
  end

end
