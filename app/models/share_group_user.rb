class ShareGroupUser <  ActiveRecord::Base
  belongs_to :share_group
  belongs_to :user
end
