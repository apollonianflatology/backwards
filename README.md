# Backwards

Multiple strategies for reversing a string without using any methods named `reverse`.

Each strategy is a refinement you can use if for some reason you don't like using built in string reversing methods. Each strategy is multibyte character safe (in modern Ruby at least).

# Benchmarks

Run `ruby lib/backwards/benchmarks.rb` to run the benchmarks.

All the strategies are basically the same, but much slower than using `reverse`. 🎉

```
Warming up --------------------------------------
             reverse   273.806k i/100ms
         InPlaceSwap    33.286k i/100ms
            Iterator    42.064k i/100ms
               Array    12.412k i/100ms
              Downto    20.710k i/100ms
      EachWithObject    31.488k i/100ms
             InPlace    25.531k i/100ms
Calculating -------------------------------------
             reverse      7.213M (± 6.9%) i/s -     36.142M in   5.037753s
         InPlaceSwap    349.915k (±10.2%) i/s -      1.731M in   5.024303s
            Iterator    362.580k (± 5.2%) i/s -      1.809M in   5.003417s
               Array    365.376k (± 3.9%) i/s -      1.825M in   5.002677s
              Downto    372.207k (± 1.6%) i/s -      1.864M in   5.008950s
      EachWithObject    369.926k (± 1.7%) i/s -      1.858M in   5.023528s
             InPlace    372.649k (± 1.5%) i/s -      1.864M in   5.002560s

Comparison:
             reverse:  7212919.3 i/s
             InPlace:   372648.8 i/s - 19.36x  slower
              Downto:   372206.9 i/s - 19.38x  slower
      EachWithObject:   369926.3 i/s - 19.50x  slower
               Array:   365375.6 i/s - 19.74x  slower
            Iterator:   362579.7 i/s - 19.89x  slower
         InPlaceSwap:   349914.6 i/s - 20.61x  slower
```

# Example Usage

```ruby
using Backwards::Strategy::InPlace
'hello world'.backwards
# => 'dlrow olleh'
```


# Development

* Add a new strategy as a String refinement, and require it in [lib/backwards.rb](lib/backwards.rb).
* RSpec will automatically pick it up and run the standard test suite against it.
* Run benchmarks and update this README above. 
