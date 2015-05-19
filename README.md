# Clocker

Find out how long that block of code takes to run.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clocker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install clocker

## Usage

```
clocker = Clocker.new
clocker.clock do
  # code here
end
```