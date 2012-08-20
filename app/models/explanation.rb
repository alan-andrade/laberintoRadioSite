class Explanation < ActiveRecord::Base
  attr_accessible :body

  belongs_to :explainable, polymorphic: true
  attr_accessible :polymorphic
end
