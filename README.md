# Clocker

[![Gem Version](https://badge.fury.io/rb/clocker.svg)](http://badge.fury.io/rb/clocker)

A simple RubyGem that gauges how long that Ruby command or block of code takes to run.

## Usage
### Command Line
Simply run `clocker` followed by a command or block of code. Add an `-m` before the command or block to print out start and end times.

Ex. 1
```
$ clocker "puts 'hi'"
hi
Clocked at 0 mins, 0 secs, 0 ms
```

Ex. 2
```
$ clocker "2.times { puts 'hello world'; sleep(0.6) }"
hello world
hello world

Clocked at 0 mins, 1 secs, and 210 ms
```

Ex. 3
```
$ clocker -m "1.upto(5) { |i| print i+1; sleep(0.4) }"
start: 2015-08-18 16:16:47 -0700
23456
ended: 2015-08-18 16:16:49 -0700

Clocked at 0 mins, 2 secs, and 12 ms
```

### Gem Library
Add this line to your application's Gemfile:

```ruby
gem 'clocker'
```

And then execute:
```
$ bundle
```

Or install it yourself as:
```
$ gem install clocker
```

Sample code block:
```ruby
>> clocker = Clocker.new
>> clocker.clock do
>>  # code here
>> end
```

By default, clocker will not print out the start time before the command|block, or the end time after the command|block, unless you pass the instance `show_messages: true`.

```ruby
>> c1 = Clocker.new
>> duration = c1.clock do
>>  3.times { print 'c1'; sleep(1) }
>> end
>> puts
>> puts duration

c1c1c1
{:mins=>0, :secs=>3, :ms=>13}
```

```ruby
>> c2 = Clocker.new(show_messages: true)
>> duration = c2.clock do
>>  3.times { print 'c2'; sleep(1) }
>> end
>> puts duration

start: 2015-08-18 16:07:17 -0700
c2c2c2
ended: 2015-08-18 16:07:20 -0700
{:mins=>0, :secs=>3, :ms=>14}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/michaelchadwick/clocker.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
