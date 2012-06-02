class Receipt

  NON_IMPORT_TAX_RATE = 0.1
  IMPORT_TAX_RATE = 0.05

  EXEMPTED = %w(BOOKS CHOCOLATE PILLS)

  attr_reader :shopping_list
  attr_reader :receipt_total

  #
  #
  #
  def initialize input
    @shopping_list = input.inject(Array.new) { |list, itemStr| list << Item.new(itemStr)}
    @receipt_total = 0.0
  end

  #
  #
  #
  def calculate
    @shopping_list.each { |item|
      tax_multiplier = 1 + (item.exempt ? 0 : NON_IMPORT_TAX_RATE) + (item.imported ? IMPORT_TAX_RATE : 0)
      unadjusted_total_with_tax = item.price * tax_multiplier
      item.total_with_tax = tax_multiplier != 1 ? unadjusted_total_with_tax.round(1) + 0.05 : item.price
      @receipt_total += item.total_with_tax
    }
  end

  #
  #
  #
  def to_s
    item_text = @shopping_list.inject('') { |result, item|
      result += item.to_s
    }
    item_text +=  'Total: ' + @receipt_total.to_s
  end

  private

  #
  # This class represents an Item
  #
  class Item

    attr_reader :exempt, :imported, :price, :description, :qty
    attr_accessor :total_with_tax

    #
    #
    def initialize itemStr
      if itemStr.nil? || itemStr.empty?
        raise 'Input for item is empty. Cannot create item.'
      else
        @qty = itemStr.to_s.scan(%r/^(\d+)/).flatten.first.to_i  # scan returns an array of arrays so need to flatten first
        @description = itemStr.to_s.scan(%r/\s(.+)\sat/i).flatten.first
        @price = itemStr.to_s.scan(%r/(\d+.[0-9][0-9])/).flatten.first.to_f

        if @qty == 0 || @description == nil || @price == 0
          raise 'Invalid input for item.  Should be: {qty} {description} at {price}'
        end

        @imported = itemStr.to_s.scan(%r/imported/i).size > 0 ? true : false
        @exempt = (@description.to_s.upcase.split & EXEMPTED).size > 0 ? true : false
        @total_with_tax = 0.00
      end
    end

    def to_s
      @qty.to_s + ' ' + @description + ': ' + @total_with_tax.to_s + '\r'
    end

  end

end