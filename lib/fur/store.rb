require_relative 'stachable'
require_relative 'file_overwritable'

module Fur
  class Store
    include FileOverwritable
    include Stachable

    def initialize diff
      @diff        = diff
      @old_pointer = File.read '.fur/pointer'
      @new_pointer = "#{@old_pointer.to_i + 1}"
    end

    def run
      store_diff
      copy_working_dir_to_stache
      increment_pointer

      puts "Project stored at pointer version #{@new_pointer}."
    end

    def store_diff
      overwrite_on_file @diff, ".fur/diffs/#{@old_pointer}.f"
    end

    def increment_pointer
      overwrite_on_file @new_pointer, '.fur/pointer'
    end

    def self.create
      diff = `diff -ruN --exclude=.fur .fur/stache/ .`
      diff.empty? ? Fur::Store::Null.new : new(diff)
    end

    class Null
      def run
        puts 'No diff since last store.'
      end
    end
  end
end
