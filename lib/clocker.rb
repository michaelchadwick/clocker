# Clocker

# Allows you to run a process for a time and get stats on how long it took
# If you give it ms bounds on init, it will just run a timer for a random 
# time between the two params

class Clocker
  def initialize(options = {})
    @options = options
  end

  def clock
    @start = Time.now
    unless @options[:messages_on].nil?
      puts "start: #{@start}"
    end
  
    begin
      yield
    rescue StandardError => e
      puts e.message
    end
    stop
  end
  
  def stop
    @stop = Time.now
    unless @options[:messages_on].nil?
      puts "\nended: #{@stop}"
    end
    ms = ((@stop - @start) * 1000).to_i
    if ms > 1000
      secs = ms / 1000
      ms = ms % 1000
      return { :secs => secs, :ms => ms }
    else
      return { :secs => 0, :ms => ms }
    end
  end
end
