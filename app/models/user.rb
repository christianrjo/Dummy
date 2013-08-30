class User < ActiveRecord::Base
  validates :name, presence: true
  validates :password, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX }
  
  def self.authenticate(email,password)
    
  end

end
