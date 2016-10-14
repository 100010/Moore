class ShareGroup < ActiveRecord::Base
  has_many :users, through: :share_group_users
end
