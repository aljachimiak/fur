require_relative 'move_direction'

module Fur
  class Back < MoveDirection
    def after_restore
      decrement_pointer
      reverse_patch_working_tree
    end
  end
end
