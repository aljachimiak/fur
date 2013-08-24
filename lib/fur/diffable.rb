module Fur
  module Diffable
    DIFF_BETWEEN_STACHE_AND_WORKING_DIR_COMMAND =
      'diff -ruN --exclude=.fur .fur/stache .'

    def diff_between_stache_and_working_dir
      `#{diff_between_stache_and_working_dir_command}`
    end

    def diff_between_stache_and_working_dir_command
      DIFF_BETWEEN_STACHE_AND_WORKING_DIR_COMMAND
    end

    def number_of_diffs
      Dir.entries('.fur/diffs').length - 2
    end
  end
end
