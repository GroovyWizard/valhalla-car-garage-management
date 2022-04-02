require "test_helper"
require "./app/services/sale_value_updater"

class OperationValueCalculatorTest < ActionDispatch::IntegrationTest
    test "Operational value calculator should return the correct total value" do
        @part1 = Part.create(name: "Part 1 test", value: 3.5)
        @part2 = Part.create(name: "Part 2 test", value: 3.5)
       
        @sale = Sale.create(name: "Sale test", description: "bruh")
        SalePart.create(sale: @sale, part: @part1)
        SalePart.create(sale: @sale, part: @part2)
        
        @total_value = SaleValueUpdater.calculate_total_value(@sale)
       
        assert_equal 7.0, @total_value
    end
end
