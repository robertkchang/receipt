require_relative 'receipt_helper'

#
# Receipt
#
# Contains nested class Item
#
class Receipt

  NON_IMPORT_TAX_RATE = 0.1
  IMPORT_TAX_RATE = 0.05

  EXEMPTED = %w(BOOK CHOCOLATE PILL)

  @@pluralized_exempted_list = Array.new

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
  # Lazy init the pluralized exempted list
  #
  def self.exempted_list
    if @@pluralized_exempted_list.empty?
      @@pluralized_exempted_list = EXEMPTED.inject(Array.new) { |list, itemName|
        list << itemName
        list << itemName + 'S'
      }
    end

    @@pluralized_exempted_list
  end

  #
  # Calculates the receipt tax and total
  #
  def calculate
    @shopping_list.each { |item|
      tax_multiplier = 1 + (item.exempt? ? 0 : NON_IMPORT_TAX_RATE) + (item.imported? ? IMPORT_TAX_RATE : 0)
      total_with_tax = item.price * tax_multiplier

      # if there is sales tax, determine if total needs to be round to nearest 0.05
      if tax_multiplier != 1
        item.total_with_tax = ReceiptHelper.round_to_decimal total_with_tax, 0.05
      else
        item.total_with_tax = item.price
      end

      @receipt_tax += item.total_with_tax - item.price
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

  private

  #
  # This nested class represents an Item in a Receipt
  #
  class Item

    attr_reader :price, :description, :qty
    attr_accessor :total_with_tax

    def exempt?; !!@exempt; end
    def imported?; !!@imported; end

    #
    # Constructor
    #
    def initialize itemStr
      if itemStr.nil? || itemStr.empty?
        raise 'Input for item is empty. Cannot create item.'
      else
        # scan returns an array of arrays so need to flatten first
        @qty = itemStr.to_s.scan(%r/^(\d+)/).flatten.first.to_i
        @description = itemStr.to_s.scan(%r/\s(.+)\sat/i).flatten.first
        @price = itemStr.to_s.scan(%r/(\d+.[0-9][0-9])/).flatten.first.to_f

        if @qty == 0 || @description == nil || @price == 0
          raise "Invalid input for item: '#{itemStr}'. Should be: {qty} {description} at {price}"
        end

        @imported = itemStr.to_s.scan(%r/imported/i).size > 0 ? true : false

        # do set intersection to determine if exempts
        @exempt = (@description.to_s.upcase.split & Receipt.exempted_list).size > 0 ? true : false
        @total_with_tax = 0.00
      end
    end

    #
    # Override to return item details
    #
    def to_s
      @qty.to_s + " " + @description + ": " + ("%.02f" % @total_with_tax).to_s + "\r\n"
    end

  end

end