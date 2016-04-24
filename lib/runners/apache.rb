module Apache

  def self.status
    #state = system( "service apache2 status" )
    state = system( "echo 'apache reloaded.'" )
    puts "state: #{state}"
    if state
      Log.log("Apache is running.")
    else
      Log.error("Apache not running !! #{state}")
    end
  end

end
