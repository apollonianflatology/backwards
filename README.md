# Backwards

[![Build Status](https://travis-ci.org/apollonianflatology/backwards.svg?branch=master)](https://travis-ci.org/apollonianflatology/backwards)

Multiple strategies for reversing a string without using any methods named `reverse`. Investigating some possible solutions to the common interview question.

Each strategy is a refinement you can use if for some reason you don't like using built in string reversing methods. Each strategy is multibyte character safe (in modern Ruby at least).

You should probably never use this, because a built-in C function is always going to be faster than anything written in ruby.

# Benchmarks

Run `rake benchmark` to run the benchmarks.

All the strategies are basically the same, but much slower than using `reverse`. 🎉

## Iterations per second

```
Warming up --------------------------------------
             reverse   284.671k i/100ms
              Downto    12.604k i/100ms
      EachWithObject    12.018k i/100ms
             InPlace    11.900k i/100ms
         InPlaceSwap    12.661k i/100ms
            Iterator    12.767k i/100ms
              SortBy    13.878k i/100ms
               Array    12.462k i/100ms
Calculating -------------------------------------
             reverse      7.400M (± 3.6%) i/s -     37.007M in   5.008176s
              Downto    144.957k (± 7.9%) i/s -    731.032k in   5.079960s
      EachWithObject    138.033k (± 9.0%) i/s -    685.026k in   5.007222s
             InPlace    137.747k (± 8.4%) i/s -    690.200k in   5.048811s
         InPlaceSwap    137.302k (± 8.1%) i/s -    683.694k in   5.013102s
            Iterator    136.282k (± 9.0%) i/s -    676.651k in   5.010478s
              SortBy    141.263k (± 6.4%) i/s -    707.778k in   5.031110s
               Array    134.489k (±10.4%) i/s -    672.948k in   5.060711s

Comparison:
             reverse:  7399556.8 i/s
              Downto:   144956.9 i/s - 51.05x  slower
              SortBy:   141263.1 i/s - 52.38x  slower
      EachWithObject:   138032.9 i/s - 53.61x  slower
             InPlace:   137747.5 i/s - 53.72x  slower
         InPlaceSwap:   137301.5 i/s - 53.89x  slower
            Iterator:   136282.5 i/s - 54.30x  slower
               Array:   134489.1 i/s - 55.02x  slower

```

## Allocations

```
Calculating -------------------------------------
             reverse    80.000  memsize (     0.000  retained)
                         2.000  objects (     0.000  retained)
                         2.000  strings (     0.000  retained)
              Downto   816.000  memsize (    40.000  retained)
                        11.000  objects (     1.000  retained)
                         8.000  strings (     1.000  retained)
      EachWithObject   448.000  memsize (    40.000  retained)
                         9.000  objects (     1.000  retained)
                         7.000  strings (     1.000  retained)
             InPlace   360.000  memsize (     0.000  retained)
                         9.000  objects (     0.000  retained)
                         6.000  strings (     0.000  retained)
         InPlaceSwap   280.000  memsize (     0.000  retained)
                         7.000  objects (     0.000  retained)
                         5.000  strings (     0.000  retained)
            Iterator   280.000  memsize (    80.000  retained)
                         7.000  objects (     2.000  retained)
                         7.000  strings (     2.000  retained)
              SortBy     2.332k memsize (   548.000  retained)
                        26.000  objects (     2.000  retained)
                         8.000  strings (     1.000  retained)
               Array     2.316k memsize (   548.000  retained)
                        26.000  objects (     2.000  retained)
                         8.000  strings (     1.000  retained)

Comparison:
             reverse:         80 allocated
         InPlaceSwap:        280 allocated - 3.50x more
            Iterator:        280 allocated - 3.50x more
             InPlace:        360 allocated - 4.50x more
      EachWithObject:        448 allocated - 5.60x more
              Downto:        816 allocated - 10.20x more
               Array:       2316 allocated - 28.95x more
              SortBy:       2332 allocated - 29.15x more

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
