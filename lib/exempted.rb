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

  #
  # do Set intersection to determine if description contains a name that is exempted
  #
  def self.exempt? description
    (description.to_s.upcase.split & Exempted.list).size > 0 ? true : false
  end
end