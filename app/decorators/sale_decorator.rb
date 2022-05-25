class SaleDecorator < Draper::Decorator

  def link_to
    h.link_to object.name, h.edit_sale_path(object)
  end

end 