class User < ApplicationRecord
  validates_presence_of :password, require: true
  validates :username, presence: true, uniqueness: true

  has_secure_password

  enum role: %w(default admin)

end
