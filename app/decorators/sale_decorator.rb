class SaleDecorator < Draper::Decorator
  def link_to
    h.link_to object.name, h.sale_path(object)
  end

  def delete
    links = []
    links.append(h.link_to 'Deletar', h.sale_path(object), method: :delete, remote: true )
    h.safe_join(links, '')
  end

  def edit 
    links = []
    links.append(h.link_to 'Editar ',   h.edit_sale_path(object) )
    h.safe_join(links, '')
  end 

  def pdf 
    links = []
    links.append(h.link_to "PDF", h.sale_path(object, format: :pdf))
    h.safe_join(links, '')
  end 
end 