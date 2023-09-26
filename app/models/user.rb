class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    user = self.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user
    elsif user && user.authenticate(password.downcase)
      user
    else
      nil
    end
  end
end
