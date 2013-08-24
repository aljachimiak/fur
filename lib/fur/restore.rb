require_relative 'diffable'
require_relative 'patchable'

module Fur
  class Restore
    include Diffable
    include Patchable

    def run
      unless diff_between_stache_and_working_dir.empty?
        puts message = "This will destroy your changes. Continue? [y/n]"

        until ['y', 'n'].include?(response = $stdin.gets.chomp)
          puts message
        end
	  
        response == 'y' ? replace_working_dir_with_stache : exit
      end
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
