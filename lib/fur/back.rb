require_relative 'stachable'
require_relative 'restore'
require_relative 'patchable'
require_relative 'pointable'
require_relative 'restorable'

module Fur
  class Back
    include Stachable
    include Patchable
    include Pointable
    include Restorable

    def run
      restore
      decrement_pointer
      patch_working_tree_with_previous_diff
      remove_stache
      copy_working_dir_to_stache
    end

    def patch_working_tree_with_previous_diff
      patch_working_tree_with reverse_patch_command
    end
  end
end
