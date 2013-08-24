require_relative 'pointable'

module Fur
  module Patchable
    include Pointable

    PATCH_COMMAND         = 'patch -p0'
    REVERSE_PATCH_COMMAND = "#{PATCH_COMMAND} -R"

    def patch_command
      PATCH_COMMAND
    end

    def reverse_patch_command
      REVERSE_PATCH_COMMAND
    end

    def patch_working_tree
      patch_working_tree_with patch_command
    end

    def reverse_patch_working_tree
      patch_working_tree_with reverse_patch_command
    end

    def patch_working_tree_with strategy
      `#{strategy} < .fur/diffs/#{current_pointer}.f`
    end
  end
end
