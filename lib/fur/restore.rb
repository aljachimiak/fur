require_relative 'diffable'

module Fur
  class Restore
    include Diffable

    def run
      unless diff_between_stache_and_working_dir.empty?
        replace_working_dir_with_stache
      end
    end

    def replace_working_dir_with_stache
      `#{diff_between_stache_and_working_dir_command} | patch -R -p0`
    end
  end
end
