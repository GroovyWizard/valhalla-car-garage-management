class SaleDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    @view_columns ||= {
      id: { source: "Sale.id" },
      name: { source: "Sale.name", searchable: true, orderable: true },
      description: { source: "Sale.description",  searchable: true, orderable: true },
      value: { source: "Sale.value" , orderable: true },
      created_at: { source: "Sale.created_at", orderable:true, searchable:true}
    }
  end
  
  def get_raw_records
    Sale.all
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.decorate.link_to,
        description: record.description,
        value: record.get_total_value,
        created_at: record.created_at_normalized,
        DT_RowId: record.id,
      }
    end
  end

  
end

