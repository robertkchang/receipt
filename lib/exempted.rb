#
# This class is a singleton that returns a list of exempted items and their pluralized form
#
class Exempted

  EXEMPTED = %w(BOOK CHOCOLATE PILL)

  @@pluralized_exempted_list = EXEMPTED.inject(Array.new) { |list, itemName|
    list << itemName
    list << itemName + 'S'
  }

  def self.list
    return @@pluralized_exempted_list
  end
end