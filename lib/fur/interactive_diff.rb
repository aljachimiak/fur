require_relative 'diffable'

module Fur
  class InteractiveDiff
    include Diffable

    def initialize options
      @when_empty_diff = options[:when_empty_diff]
      @ask             = options[:ask]
      @when_yes        = options[:when_yes]
    end

    def call
      if diff_between_stache_and_working_dir.empty?
        @when_empty_diff.call
      else
        puts message = "#{@ask} [y/n]"

        until ['y', 'n'].include?(response = $stdin.gets.chomp)
          puts message
        end
	  
        response == 'y' ? @when_yes.call : exit
      end
    end
  end
end
