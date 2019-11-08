lib = File.expand_path('..', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'benchmark/ips'
require 'backwards'

Benchmark.ips do |x|
  x.report('reverse') do
    'abcde'.reverse
  end

  Backwards::Strategy.constants.each do |strategy|
    x.report(strategy) do
      using Backwards::Strategy.const_get(strategy)
      'abcde'.backwards
    end
  end

  x.compare!
end
