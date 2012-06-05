class Float
    #
    # Rounds value up to nearest 0.05
    #          0.6 -> 0.6
    #          0.625 ->  0.65
    #          0.63 -> 0.65
    #          0.65 -> 0.65
    #          0.675 -> 0.7
    #          0.68 -> 0.7
    #
    def round_to_05
      (self * 20.0).ceil / 20.0
    end
end