#
# This class is a singleton that returns a list of exempted items and their pluralized form
#
class Exempted

  EXEMPTED = %w(BOOK CHOCOLATE PILL)

  #
  # determine if description contains one of the EXEMPTED
  #
  def self.exempt? description
    # remove S if pluralized
    desc_arr = description.to_s.upcase.split.inject(Array.new) { |list, token|
      token.end_with?('S') ? list << token.chop : list << token
    }

    # do Set intersection
    (desc_arr & EXEMPTED).size > 0 ? true : false
  end
end