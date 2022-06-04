class PartDecorator < Draper::Decorator
  def link_to
    h.link_to object.name, h.part_path(object)
  end

  def delete
    links = []
    links.append(h.link_to 'Deletar', h.part_path(object), method: :delete, remote: true )
    h.safe_join(links, '')
  end

  def edit 
    links = []
    links.append(h.link_to 'Editar ',   h.edit_part_path(object) )
    h.safe_join(links, '')
  end 

end 