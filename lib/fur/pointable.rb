require_relative 'file_overwritable'

module Fur
  module Pointable
    include FileOverwritable

    FILE_NAME = '.fur/pointer'

    def current_pointer
      File.read FILE_NAME
    end

    def decrement_pointer
      change_pointer :-, 1
    end

    def increment_pointer
      change_pointer :+, 1
    end
 
    def change_pointer operation, num
      new_pointer = "#{current_pointer.to_i.send operation, num}"
      overwrite_on_file new_pointer, FILE_NAME
    end
  end
end
