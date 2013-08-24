require_relative 'stachable'
require_relative 'restore'
require_relative 'patchable'
require_relative 'pointable'

module Fur
  class Back
    include Stachable
    include Patchable
    include Pointable

    def initialize
      @restore = Restore.new
    end

    def run
      @restore.run
      decrement_pointer
      patch_working_tree_with_previous_diff
      remove_stache
      copy_working_dir_to_stache
    end

    def patch_working_tree_with_previous_diff
      `#{reverse_patch_command} < .fur/diffs/#{current_pointer}.f`
    end

    def remove_stache
      `rm -r .fur/stache/*`
    end
  end
end
