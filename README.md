# Backwards

Multiple strategies for reversing a string without using any methods named `reverse`.

Each strategy is a refinement you can use if for some reason you don't like using built in string reversing methods. Each strategy is multibyte character safe (in modern Ruby at least).

# Benchmarks

Run `ruby lib/backwards/benchmarks.rb` to run the benchmarks.

All the strategies are basically the same, but much slower than using `reverse`. 🎉

```
Warming up --------------------------------------
             reverse   256.828k i/100ms
              downto    27.600k i/100ms
    each_with_object    33.763k i/100ms
            in_place    32.406k i/100ms
       in_place_swap    40.066k i/100ms
            iterator    43.798k i/100ms
Calculating -------------------------------------
             reverse      7.435M (± 5.4%) i/s -     37.240M in   5.025961s
              downto    514.695k (± 6.9%) i/s -      2.567M in   5.014585s
    each_with_object    518.445k (± 5.4%) i/s -      2.600M in   5.030954s
            in_place    533.130k (± 4.1%) i/s -      2.690M in   5.054095s
       in_place_swap    528.486k (± 4.0%) i/s -      2.644M in   5.012267s
            iterator    525.024k (± 4.2%) i/s -      2.628M in   5.014507s

Comparison:
             reverse:  7434706.5 i/s
            in_place:   533130.1 i/s - 13.95x  slower
       in_place_swap:   528486.1 i/s - 14.07x  slower
            iterator:   525023.8 i/s - 14.16x  slower
    each_with_object:   518444.9 i/s - 14.34x  slower
              downto:   514695.0 i/s - 14.44x  slower
```

# Example Usage

```ruby
using Backwards::Strategy::InPlace
'hello world'.backwards
# => 'dlrow olleh'
```
