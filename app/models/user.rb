class User < ApplicationRecord
  has_many :sales

  enum role: { owner: 0, worker: 1, admin: 2 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def parsed_role
    case self.role
    when "owner"
      "Ultra Admin"
    when "worker"
      "Mecanico"
    when "admin"
      "Administrador"
    end
  end

  def is_admin
    if self.role == "admin" or "owner"
      return true
    end
  end

  def self.users_by_sale
    @users_by_sale = User
      .left_joins(:sales)
      .group(:id)
      .order("COUNT(sales.id) DESC")
    return @users_by_sale
  end

  def created_at_normalized
    return Date.parse(self.created_at.to_s)
  end
end
