module Backwards
  module Strategy
    module InPlace
      refine String do
        def backwards
          (length - 1).times do |i|
            insert(-(i + 1), slice!(0))
          end

          self
        end
      end
    end
  end
end
