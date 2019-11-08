# Backwards

Multiple strategies for reversing a string without using any methods named `reverse`.

Each strategy is a refinement you can use if for some reason you don't like using built in string reversing methods. Each strategy is multibyte character safe (in modern Ruby at least).

# Example Usage

```ruby
using Backwards::Strategy::InPlace
'hello world'.backwards
# => 'dlrow olleh'
```
