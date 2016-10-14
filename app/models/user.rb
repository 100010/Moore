class User < ActiveRecord::Base
  has_many :comments
  has_many :share_groups, through: :share_group_users

  attr_accessor :remember_token, :reset_token

  VALID_EMAIL_REGIX                = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  AVAILABLE_GENDER_HASH            = { "男性" => 0, "女性" => 1 }
  AVAILABLE_DEPARTMENT_HASH        = { "理工" => 0, "経営工" => 1, "工" => 2, "理" => 3}
  AVAILABLE_UNDERGRADUATE_HASH     = { "機械" => 0, "電気電子" => 1, "情報" => 2}

  enum gender: User::AVAILABLE_GENDER_HASH
  enum undergraduate: User::AVAILABLE_DEPARTMENT_HASH
  enum department: User::AVAILABLE_UNDERGRADUATE_HASH

  before_save { self.email = email.downcase }

  has_secure_password

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update(remember_digest: User.digest(remember_token))
  end

  def authenticated?(remember_token, user)
    BCrypt::Password.new(user.remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def used_email?
    User.find_by email: self.email
  end
end
