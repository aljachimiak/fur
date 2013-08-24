require_relative 'move_direction'

module Fur
  class Forward < MoveDirection
    extend Pointable
    extend Diffable

    def after_restore
      patch_working_tree
      increment_pointer
    end

    def self.create
      future_pointer? ? new : Null.new
    end

    def self.future_pointer?
      number_of_diffs != current_pointer.to_i
    end

    class Null
      def run
        puts "Cannot move forward: project is at latest version"
      end
    end
  end
end
