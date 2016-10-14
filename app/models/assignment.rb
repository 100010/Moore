class Assignment < ActiveRecord::Base
  belongs_to :comment
  belongs_to :lecture
end
