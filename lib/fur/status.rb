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
        puts "Your fur pointer is at pointer 0"
      end

  
      if diff_between_stache_and_working_dir.empty?
        puts "There are no changes since your last store."
      else
        puts "There are changes since your last store."
        puts message = "Would you like to see the diff? [y/n]"

        until ['y', 'n'].include?(response = $stdin.gets.chomp)
          puts message
        end

        puts diff_between_stache_and_working_dir if response == 'y'
      end
    end
  end
end
