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
      puts "began: #{@start}"
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
      puts "\nstopped: #{@stop}"
    end
    duration = ((@stop - @start) * 1000).to_i
    puts "\n#{duration} ms elapsed"
  end
end
