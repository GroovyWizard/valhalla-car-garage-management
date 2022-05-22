class User < ApplicationRecord
  has_many :sales 

  enum role: {owner: 0, worker: 1, admin: 2 } 
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def parsed_role
    case self.role 
      when "owner" then
        "Ultra Admin"
      when "worker" then
        "Mecanico"
      when "admin" then
        "Administrador" 
    end
  end
  
  def is_admin
    if self.role == "admin" or "owner"
      return true
    end
  end 
end
