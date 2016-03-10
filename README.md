[![Build Status](https://circleci.com/gh/appfolio/alexander_graham_bell.svg?style=svg)](https://circleci.com/gh/appfolio/alexander_graham_bell.svg?style=svg)

# AlexanderGrahamBell

Phone number parser and tel link creator.

## Install

```
gem install alexander_graham_bell
```


## Requirements

* Ruby 2.2.3 or higher

## Examples
#### Generate a tel link
```ruby
puts AlexanderGrahamBell.tel_link('1-800-555-1234')
# <a href=\"tel:18005551234\">1-800-555-1234</a>
```
#### Generate a tel link with an extension
```ruby
puts AlexanderGrahamBell.tel_link('1-800-555-1234ext5')
#<a href=\"tel:18005551234;isub=5\">1-800-555-1234ext5</a>
```
#### Get the href contents
```ruby
puts AlexanderGrahamBell.tel_href('1-800-555-1234')
# tel:18005551234
```
#### For use with rails
```ruby
# If you're using rails and you want to html escape everything wrap it in your own module or class.

module MyTelLinkGenerator
  def self.build(phone_number)
    AlexanderGrahamBell.tel_link(phone_number).html_safe
  end
end

MyTelLinkGenerator.build('+18052234567ext5')
```
