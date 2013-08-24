require_relative 'move_direction'

module Fur
  class Back < MoveDirection
    extend Pointable

    def after_restore
      decrement_pointer
      reverse_patch_working_tree
    end

    def self.create
      current_pointer == '0' ? Null.new : new
    end

    class Null
      def run
        puts "Cannot move back when pointer is at 0"
      end
    end
  end
end
