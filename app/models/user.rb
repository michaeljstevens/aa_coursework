# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :text             not null
#  password_digest :text             not null
#  session_token   :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :goals

  after_initialize :ensure_session_token

  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    pass_dig = BCrypt::Password.new(self.password_digest)
    pass_dig.is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(32)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    if user && user.is_password?(password)
      user
    else
      nil
    end
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(32)
    self.save!
    self.session_token
  end

end
