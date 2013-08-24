require_relative 'pointable'
require_relative 'diffable'

module Fur
  class Status
    include Pointable
    include Diffable

    def run
      if current_pointer.to_i > 0
        puts "Your fur pointer is at #{current_pointer} of #{number_of_diffs}."
      else
        puts "Your project is at its initial state."
      end
    end
  end
end
