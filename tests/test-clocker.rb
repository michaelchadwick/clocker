require 'clocker'

c1 = Clocker.new

duration1 = c1.clock do
  3.times { print 'c1'; sleep(1) }
end

puts
puts duration1

c2 = Clocker.new(show_messages: true)

duration2 = c2.clock do
  3.times { print 'c2'; sleep(1) }
end

puts duration2
