module Fur
  module Patchable
    REVERSE_PATCH_COMMAND = 'patch -R -p0'

    def reverse_patch_command
      REVERSE_PATCH_COMMAND
    end
  end
end
