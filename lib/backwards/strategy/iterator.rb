module Backwards
  module Strategy
    module Iterator
      refine String do
        def backwards
          n = 0
          out = ''
          out << self[n] while (n -= 1) >= -length
          out
        end
      end
    end
  end
end
