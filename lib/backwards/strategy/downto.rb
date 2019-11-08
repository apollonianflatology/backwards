module Backwards
  module Strategy
    module Downto
      refine String do
        def backwards
          length.downto(1).map { |n| self[n - 1] }.join('')
        end
      end
    end
  end
end
