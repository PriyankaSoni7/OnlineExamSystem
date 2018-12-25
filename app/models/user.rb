class User < ApplicationRecord
  validates :username, :password, :password_confirmation, :role
  has_many :submits 
  
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates :email , :uniqueness => true
  
  has_secure_password
  
  ROLES = %w[ guest student author ]

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
end
