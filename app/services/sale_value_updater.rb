class SaleValueUpdater
    def self.calculate_total_value(operation)
        if operation.parts.count > 0  
            @total_value = operation.parts.reload.map{ |part| part.value }.sum
        else  
            @total_value = 0.0 
        end 

        operation.value = @total_value
        return @total_value
    end
end
