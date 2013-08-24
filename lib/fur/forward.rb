require_relative 'move_direction'

module Fur
  class Forward < MoveDirection
    def after_restore
      patch_working_tree
      increment_pointer
    end
  end
end
