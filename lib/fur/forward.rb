require_relative 'stachable'
require_relative 'restore'
require_relative 'patchable'
require_relative 'pointable'
require_relative 'restorable'

module Fur
  class Forward
    include Stachable
    include Patchable
    include Pointable
    include Restorable

    def run
      restore
      patch_working_tree_with_current_diff
      increment_pointer
      remove_stache
      copy_working_dir_to_stache
    end

    def patch_working_tree_with_current_diff
      patch_working_tree_with patch_command
    end
  end
end
