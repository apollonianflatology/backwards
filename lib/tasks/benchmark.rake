require 'benchmark/ips'
require 'benchmark/memory'
require 'backwards'

namespace :benchmark do
  desc 'Run iteration per second benchmark'
  task :ips do
    puts 'Running i/s benchmark:'

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

    puts
  end

  desc 'Run memory allocation benchmark'
  task :memory do
    puts 'Running memory allocation benchmark:'

    Benchmark.memory do |x|
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

    puts
  end

  desc 'Run all benchmarks'
  task(all: %i(memory ips))
end
