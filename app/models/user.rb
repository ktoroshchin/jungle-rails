class User < ActiveRecord::Base
  validates :email, uniqueness: { case_sensitive: false }

  validates :name, presence: true
  validates :password,
    length: { minimum: 6 }

  has_secure_password
   def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      return user
    else
      return false
    end
  end



end
