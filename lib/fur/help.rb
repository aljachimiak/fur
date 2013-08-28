module Fur
  class Help 

    def run
      help_file = File.dirname(__FILE__)+"/help.txt"
      puts File.read(help_file)
    end
  end
end
