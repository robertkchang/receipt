require_relative 'constants'
#
# This class represents an Item in a Receipt
#
class Item
  attr_reader :price, :description, :qty
  attr_accessor :total

  def imported?; !!@imported; end
  def exempt?; !!@exempt; end

  # Constructor
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

      @total = 0.00
      @imported = itemStr.to_s.scan(%r/imported/i).size > 0 ? true : false
      @exempt = Constants::EXEMPTED.include? description.to_s.upcase.gsub(%r/IMPORTED/, '').strip.squeeze(' ')
    end
  end

  # Override to return item details
  def to_s
    "#{@qty.to_s} #{@description}: #{("%.02f" % @total).to_s}#{Constants::CR_LF}"
  end
end