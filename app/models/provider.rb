class Provider < ApplicationRecord
  has_many :parts, dependent: :destroy
  #get all parts where has_sale, get their user id
  def self.provider_by_part
    @parts = []
    Part.all.each do |part| 
      if part.has_sale
        @parts.append(part)
      end 
    end 
    
    return @parts
  end

  def self.search(search)
    if search 
        @result = Provider.where("cnpj LIKE ?", "%" + search + "%")
        puts(@result, "here")
        return @result ? @result : Provider.all
    else 
        return Provider.all 
    end  
  end 
end
