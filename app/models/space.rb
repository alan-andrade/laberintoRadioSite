class Space < ActiveRecord::Base
  attr_accessible :day, :hour, :minute

  belongs_to :program,  inverse_of: :space,
                        validate: true

  validates :hour, :minute, :day, presence: true

  validates_uniqueness_of :hour, scope: [:day]

  def time
    @time ||= Time.now.change(hour: hour, min: minute)
  end

  def time=(attr)
    p attr
  end

end
