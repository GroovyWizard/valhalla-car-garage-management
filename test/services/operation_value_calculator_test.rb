require "test_helper"
require "./app/services/operation_calculator"

class OperationValueCalculatorTest < ActionDispatch::IntegrationTest
    test "Operational value calculator should return the correct total value" do
        @sale = Sale.create(name: "Sale test", description: "bruh", value: 0.0 )
        @sale.parts.build([ 
            {name: "testin", value: 2.0}, { name: "test2", value: 3.0 }, {name: "test3", value:5.0} 
        ])
        @total_value = OperationCalculator.calculate_total_value(@sale)

        assert_equal 10.0, @total_value
    end
end
