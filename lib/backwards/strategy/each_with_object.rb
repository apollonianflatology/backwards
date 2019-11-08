module Backwards
  module Strategy
    module EachWithObject
      refine String do
        def backwards
          each_char.with_object('') { |c, str| str.prepend(c) }
        end
      end
    end
  end
end
