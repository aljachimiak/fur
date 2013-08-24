module Fur
  module Restorable
    def restore_working_tree
      Restore.new.run
    end
  end
end
