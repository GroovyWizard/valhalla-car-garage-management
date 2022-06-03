require "./app/modules/date_parser"

class PartDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    @view_columns ||= {
      id: { source: "Part.id", searchable: true, orderable: true },
      name: { source: "Part.name", searchable: true, orderable: true },
      value: { source: "Part.value" },
      model: { source: "Part.model", orderable: true, searchable: true },
      provider_id: { source: "Part.provider_id", orderable: true, searchable: false },
      created_at: { source: "Part.created_at", orderable: true, searchable: true },
      edit: { orderable: false, searchable: false },
      delete: { orderable: false, searchable: false },
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.decorate.link_to,
        value: record.value,
        model: record.model,
        provider_id: record.provider.name,
        created_at: DateParser.readable_full_date(record.created_at),
        edit: record.decorate.edit,
        delete: record.decorate.delete,
        DT_RowId: record.id,
      }
    end
  end

  def get_raw_records
    Part.includes(:provider)
    
  end
end
