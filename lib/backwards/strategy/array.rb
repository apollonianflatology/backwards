module Backwards
  module Strategy
    module Array
      refine String do
        def backwards
          chars = split('')
          new_chars = chars.inject([]) { |acc, c| acc.unshift(c) }
          new_chars.join('')
        end
      end
    end
  end
end
