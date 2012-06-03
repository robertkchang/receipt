class ReceiptHelper

  #
  # Rounds value up to nearest decimal value given. Never rounds down. Always round to 2 decimal places
  # Example: if value_to_round = 1.625 and decimal_value_to_round_to to is 0.05
  #          1.625 ->  1.65
  #          1.63 -> 1.65
  #          1.6 -> 1.6
  #          1.675 -> 1.68
  #          1.68 -> 1.68
  #
  def self.round_to_nearest value_to_round, decimal_value_to_round_to
    rounded_value = (((value_to_round * 10).truncate)/10.0 + decimal_value_to_round_to).round(2)
    if value_to_round < rounded_value && (rounded_value - value_to_round).round(2) != decimal_value_to_round_to
      rounded_value
    else
      value_to_round.round(2)
    end
  end

end