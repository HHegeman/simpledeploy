module Sort

  def self.input(conf, input)
    tlist = []
    if input.nil?
      return conf
    else
      input.split(" ").each do |item|
        if conf.include? item
          tlist << item
        else
          Log.error("given option: #{input} is not valid, valid options are: #{conf}")
        end
      end
    end
  end

end
