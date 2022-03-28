class OperationCalculator
    def self.calculate_total_value(operation)
        @@total_value = operation.parts.map{ |part| part.value }.sum
        print(@@total_value, "here") 
        return @@total_value
    end

    def self.test()
        puts("working")
    end
end
