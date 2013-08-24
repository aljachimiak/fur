require_relative 'diffable'
require_relative 'patchable'
require_relative 'interactive_diff'

module Fur
  class Restore
    include Diffable
    include Patchable

    def initialize
      @interactive_diff_options = {
        when_empty_diff: lambda { return },
        ask:             "This will destroy your changes. Continue?",
        when_yes:        lambda { replace_working_dir_with_stache }
      }
    end

    def run
      InteractiveDiff.new(@interactive_diff_options).call
    end

    def run_with_confirmation
      run
      confirm
    end

    def replace_working_dir_with_stache
      `#{diff_between_stache_and_working_dir_command} | #{reverse_patch_command} -R -p0`
    end

    def confirm
      puts "Your working directory has been restored from the stache"
    end
  end
end
