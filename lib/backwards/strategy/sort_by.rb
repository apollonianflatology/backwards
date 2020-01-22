module Backwards
  module Strategy
    module SortBy
      refine String do
        def backwards
          split('').sort_by.with_index { |_, i| -i }.join
        end
      end
    end
  end
end
