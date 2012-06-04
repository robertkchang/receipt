require_relative 'item'
require_relative 'custom_float'
#
# This class represents a Receipt for a shopping list
#
class Receipt

  $CR_LF = "\r\n"
  NON_IMPORT_TAX_RATE = 0.1
  IMPORT_TAX_RATE = 0.05

  attr_reader :shopping_list, :receipt_tax, :receipt_total

  # Constructor
  def initialize input
    @shopping_list = input.inject(Array.new) { |list, itemStr| list << Item.new(itemStr)}
    @receipt_tax = 0.00
    @receipt_total = 0.00
  end

  # Calculates the receipt tax and total
  def calculate
    @shopping_list.each { |item|
      tax_rate = (item.exempt? ? 0.00 : NON_IMPORT_TAX_RATE) + (item.imported? ? IMPORT_TAX_RATE : 0.00)
      total_before_tax = item.qty * item.price
      tax = (total_before_tax * tax_rate).round_to_nearest_point_05

      @receipt_tax += tax
      @receipt_total += item.total = total_before_tax + tax
    }

    # do final rounding - needed due to CustomFloat quirks
    @receipt_tax = @receipt_tax.round(2)
    @receipt_total = @receipt_total.round(2)
    return self
  end

  # print
  def print; puts self end

  # Override to return receipt items, sales taxes, and total
  def to_s
    item_text = "===  Your Receipt  ===#{$CR_LF}"
    @shopping_list.each { |item| item_text += item.to_s }
    item_text +=  "Sales taxes: #{("%.02f" % @receipt_tax).to_s}#{$CR_LF}"
    item_text +=  "Total: #{("%.02f" % @receipt_total).to_s}"
  end
end