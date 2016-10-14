class Comment < ActiveRecord::Base
  belongs_to :assginment
  belongs_to :user

  include Bootsy::Container
end
