require_relative 'item'
require_relative 'exempted'
require_relative 'receipt_helper'

#
# This class represents a Receipt for a shopping list
#
#
class Receipt

  NON_IMPORT_TAX_RATE = 0.1
  IMPORT_TAX_RATE = 0.05

  attr_reader :shopping_list, :receipt_tax, :receipt_total

  #
  # Constructor
  #
  def initialize input
    @shopping_list = input.inject(Array.new) { |list, itemStr| list << Item.new(itemStr)}
    @receipt_tax = 0.00
    @receipt_total = 0.00

  end

  #
  # Calculates the receipt tax and total
  #
  def calculate
    @shopping_list.each { |item|

      # do set intersection to determine if item is exempted
      is_exempt = (item.description.to_s.upcase.split & Exempted.list).size > 0 ? true : false

      tax_multiplier = 1 + (is_exempt ? 0 : NON_IMPORT_TAX_RATE) + (item.imported? ? IMPORT_TAX_RATE : 0)
      total_with_tax = item.qty * item.price * tax_multiplier

      # if there is sales tax, determine if total needs to be round to nearest 0.05
      if tax_multiplier != 1
        item.total_with_tax = ReceiptHelper.round_to_decimal total_with_tax, 0.05
      else
        item.total_with_tax = item.price
      end

      @receipt_tax += item.total_with_tax - (item.qty * item.price)
      @receipt_total += item.total_with_tax
    }

    # do final rounding
    @receipt_tax = @receipt_tax.round(2)
    @receipt_total = @receipt_total.round(2)
  end

  #
  # Override to return receipt items, sales taxes, and total
  #
  def to_s
    item_text = @shopping_list.inject('') { |result, item|
      result += item.to_s
    }
    item_text +=  "Sales taxes: " + ("%.02f" % @receipt_tax).to_s + "\r\n"
    item_text +=  "Total: " + ("%.02f" % @receipt_total).to_s
  end
end