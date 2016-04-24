module Log
  @logged = []
  @verbose = false

  # log functie.
  def self.log(text)
    @logged << text
    puts "output: #{text}" if @verbose
  end

  def self.error(text)
    @logged << text
    puts "output: #{text}" if @verbose
    puts "ERROR: #{text}"
  end

  def self.getlog
    return @logged
  end

  def self.verbose(state)
    @verbose = state
    Log.log("realtime logging = ON") if @verbose
  end
end
