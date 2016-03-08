# AlexanderGrahamBell

Phone number parser and tel link creator.

## Install

```
gem install alexander_graham_bell
```


## Requirements

* Ruby 2.2.3 or higher

## Examples

```ruby
# Use the class methods to generate a tel link
puts AlexanderGrahamBell.tel_link('1-800-275-2273')
# <a href=\"tel:18002752273\">1-800-275-2273</a>

# Extensions
puts AlexanderGrahamBell.tel_link('+18052234567ext5')
#<a href=\"tel:+18052234567;isub=5\">+18052234567ext5</a>
```
###rails
```ruby
# If you're using rails and you want to html escape everything wrap it in your own module or class.

module MyLinkGenerator
  def self.build(phone_number)
    AlexanderGrahamBell.tel_link(phone_number).html_safe
  end
end


```
