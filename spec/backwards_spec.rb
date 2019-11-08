require 'spec_helper'

Backwards::Strategy.constants.each do |strategy|
  RSpec.describe Backwards::Strategy.const_get(strategy) do
    it_behaves_like 'reverser'
  end
end
