# lib/clocker.rb
# Clocker

class Clocker
  attr_accessor :options

  def initialize(options = {})
    self.options = options
  end

  def clock(&block)
    @start = Time.now

    if options[:show_messages]
      puts "\nstart: #{@start}"
    end

    begin
      block.call
    rescue
      puts "ERROR: invalid command or block"
    end

    return stop
  end

  def stop
    @stop = Time.now

    if options[:show_messages]
      puts "\nended: #{@stop}"
    end

    ms = ((@stop - @start) * 1000).to_i

    if ms > 60000
      mins = ms / 60000
      ms = ms - (60000 * mins)
      if ms > 1000
        secs = ms / 1000
        ms = ms % 1000
      end

      return { mins: mins, secs: secs, ms: ms }
    elsif ms > 1000
      secs = ms / 1000
      ms = ms % 1000

      return { mins: 0, secs: secs, ms: ms }
    else
      return { mins: 0, secs: 0, ms: ms }
    end
  end
end
