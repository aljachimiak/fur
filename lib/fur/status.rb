require_relative 'pointable'
require_relative 'diffable'
require_relative 'interactive_diff'

module Fur
  class Status
    include Pointable
    include Diffable

    def initialize
      @interactive_diff_options = {
        when_empty_diff: lambda { puts "There are no changes since your last store." },
        ask:             "There are changes since your last store.\nWould you like to see the diff?",
        when_yes:        lambda { puts diff_between_stache_and_working_dir }
      }
    end

    def run
      if current_pointer.to_i > 0
        puts "Your fur pointer is at #{current_pointer} of #{number_of_diffs}."
      else
        puts "Your fur pointer is at pointer 0"
      end

      InteractiveDiff.new(@interactive_diff_options).call
    end
  end
end
