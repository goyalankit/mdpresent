class Logger

  def self.debug_level?
    false
  end

  def self.log msg
    puts(msg) if debug_level?
  end
end
