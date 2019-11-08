lib = File.expand_path('..', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'benchmark/ips'
require 'backwards'

Benchmark.ips do |x|
  x.report('reverse') do
    'abcde'.reverse
  end

  x.report('downto') do
    using Backwards::Strategy::Downto
    'abcde'.backwards
  end

  x.report('each_with_object') do
    using Backwards::Strategy::EachWithObject
    'abcde'.backwards
  end

  x.report('in_place') do
    using Backwards::Strategy::InPlace
    'abcde'.backwards
  end

  x.report('in_place_swap') do
    using Backwards::Strategy::InPlaceSwap
    'abcde'.backwards
  end

  x.report('iterator') do
    using Backwards::Strategy::Iterator
    'abcde'.backwards
  end

  x.compare!
end
