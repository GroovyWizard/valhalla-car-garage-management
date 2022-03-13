class User < ApplicationRecord
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
end
