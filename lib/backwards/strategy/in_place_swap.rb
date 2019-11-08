module Backwards
  module Strategy
    module InPlaceSwap
      refine String do
        def backwards
          (length / 2).times do |i|
            self[i], self[-(i + 1)] = self[-(i + 1)], self[i]
          end

          self
        end
      end
    end
  end
end
