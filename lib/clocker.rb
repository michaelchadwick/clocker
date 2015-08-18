# Clocker

# Allows you to run a process for a time and get stats on how long it took
# If you give it ms bounds on init, it will just run a timer for a random 
# time between the two params

class Clocker
  def initialize(options = {})
    self.options = options
  end

  def clock
    @start = Time.now
    unless options[:show_messages].nil?
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
    unless options[:show_messages].nil?
      puts "ended: #{@stop}"
    end
    ms = ((@stop - @start) * 1000).to_i
    
    if ms > 60000
      mins = ms / 60000
      ms = ms - (60000 * mins)
      if ms > 1000
        secs = ms / 1000
        ms = ms % 1000
      end
      
      { mins: mins, secs: secs, ms: ms }
    elsif ms > 1000
      secs = ms / 1000
      ms = ms % 1000
      
      { mins: 0, secs: secs, ms: ms }
    else
      { mins: 0, secs: 0, ms: ms }
    end
  end
end
