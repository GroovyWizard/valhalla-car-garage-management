require "time"
require "date"

class DateParser 
    def self.readable_full_date(raw_date)
        return Date.parse(raw_date.to_s)
    end 
end 