#encoding: utf-8
class Space < ActiveRecord::Base

  # This solution sucks! but got stucked with I18n.
  DAYS = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado' ]

  attr_accessible :day, :hour, :minute


  belongs_to :program,  inverse_of: :space,
                        validate: true

  validates :hour, :minute, :day, presence: true

  validates_uniqueness_of :hour, scope: [:day]

  def time
    Time.new.change(hour:hour, min:minute)
  end

end
