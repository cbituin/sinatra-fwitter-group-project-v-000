class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true
  has_secure_password
  has_many :tweets

  def find_by_username(username)
    Self.all.select do |user|
      user.username == username
    end
  end

end
