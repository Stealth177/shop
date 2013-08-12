class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  
  ROLES = %w[admin client]
  
  def role?(role)
   self.role == role.to_s
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   attr_accessible  :email, :password, :password_confirmation, :remember_me, :role
end