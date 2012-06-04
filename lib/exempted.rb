#
# This class is a singleton that returns a list of exempted items and their pluralized form
#
class Exempted

  EXEMPTED = %w(BOOK CHOCOLATE PILL)

  @@pluralized_exempted_list = Array.new

  # Lazy init the pluralized exempted list
  def self.list
    if @@pluralized_exempted_list.empty?
      @@pluralized_exempted_list = EXEMPTED.inject(Array.new) { |list, itemName|
        list << itemName
        list << itemName + 'S'
      }
    end

    @@pluralized_exempted_list
  end
end