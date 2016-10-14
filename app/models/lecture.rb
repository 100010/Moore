class Lecture < ActiveRecord::Base
  has_many :share_groups, through: :lecture_share_groups
  has_many :assginments
end
