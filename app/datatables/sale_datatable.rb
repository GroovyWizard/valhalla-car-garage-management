class SaleDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    @view_columns ||= {
      id: { source: "Sale.id" },
      name: { source: "Sale.name", searchable: true, orderable: true },
      description: { source: "Sale.description",  searchable: true, orderable: true },
      value: { source: "Sale.value" , orderable: true },
      finished: { source: "Sale.finished", orderable: true, searchable: true},
      created_at: { source: "Sale.created_at", orderable:true, searchable:true},
      edit: { orderable: false, searchable: false},
      delete: { orderable: false, searchable: false },
      pdf: { orderable: false, searchable: false }
    }
  end
  
  

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.decorate.link_to,
        description: record.description,
        value: record.get_total_value,
        created_at: record.created_at_normalized,
        finished: record.parsed_finished,
        edit: record.decorate.edit,
        delete: record.decorate.delete,
        pdf: record.decorate.pdf,
        DT_RowId: record.id,
      }
    end
  end

  def get_raw_records
    Sale.all
  end

  
end

