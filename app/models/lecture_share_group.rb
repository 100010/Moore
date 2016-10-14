class LectureShareGroup < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :share_group
end
