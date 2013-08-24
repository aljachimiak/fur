require_relative 'stachable'
require_relative 'restore'
require_relative 'patchable'
require_relative 'pointable'
require_relative 'restorable'

module Fur
  class MoveDirection
    include Stachable
    include Patchable
    include Pointable
    include Restorable

    def run
      restore_working_tree
      after_restore
      remove_stache
      copy_working_dir_to_stache

      puts "Your project has been moved #{self.class.name.split('::').last.downcase} to pointer #{current_pointer}"
    end

    def after_restore
      raise NotImplementedError
    end
  end
end
