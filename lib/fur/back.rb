require_relative 'stachable'
require_relative 'restore'
require_relative 'file_overwritable'

module Fur
  class Back
    include FileOverwritable
    include Stachable

    def initialize
      @restore          = Restore.new
      @current_pointer  = File.read '.fur/pointer'
      @previous_pointer = "#{@current_pointer.to_i - 1}"
    end

    def run
      @restore.run
      decrement_pointer
      patch_working_tree_with_previous_diff
      remove_stache
      copy_working_dir_to_stache
    end

    def decrement_pointer
      overwrite_on_file @previous_pointer, '.fur/pointer'
    end

    def patch_working_tree_with_previous_diff
      `patch -R -p0 < .fur/diffs/#{@previous_pointer}.f`
    end

    def remove_stache
      `rm -r .fur/stache/*`
    end
  end
end
