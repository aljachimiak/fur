require_relative 'stachable'
require_relative 'file_overwritable'
require_relative 'diffable'
require_relative 'pointable'

module Fur
  class Store
    include FileOverwritable
    include Stachable
    include Pointable
    extend Diffable

    def initialize diff
      @diff        = diff
      @old_pointer = File.read '.fur/pointer'
      @new_pointer = "#{@old_pointer.to_i + 1}"
    end

    def run
      store_diff
      copy_working_dir_to_stache
      increment_pointer

      puts "Project stored at pointer version #{current_pointer}."
    end

    def store_diff
      overwrite_on_file @diff, ".fur/diffs/#{current_pointer}.f"
    end

    def self.create
      diff = diff_between_stache_and_working_dir
      diff.empty? ? Fur::Store::Null.new : new(diff)
    end

    class Null
      def run
        puts 'No diff since last store.'
      end
    end
  end
end
